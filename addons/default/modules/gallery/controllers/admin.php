<?php

class Admin extends Admin_Controller {

	protected $section = 'gallery';

	private $_gallery_base_file_dir;
	private $_gallery_base_file_cache_dir;
	private $_gallery_base_file_url;

	protected $validation_rules = array(
		array(
			'field'   => 'title', 
			'label'   => 'Title', 
			'rules'   => 'required'
		),
		array(
			'field'   => 'category_id', 
			'label'   => 'Category', 
			'rules'   => ''
		),
		array(
			'field'   => 'description', 
			'label'   => 'Description', 
			'rules'   => 'required'
		),
		array(
			'field'   => 'status', 
			'label'   => '', 
			'rules'   => ''
		),
	);
	
	public function __construct()
	{
		parent::__construct();
		
		$this->lang->load(array('gallery', 'categories'));

		$this->load->model(array('gallery_categories_m', 'files/image_m'));

		$gallery_dir = UPLOAD_PATH.'gallery';
		if ( ! is_dir($gallery_dir)) {
			mkdir($gallery_dir, 0777);
		}

		$this->_gallery_base_file_dir = $gallery_dir;
		$this->_gallery_base_file_cache_dir = $gallery_dir;
		$this->_gallery_base_file_url = base_url($gallery_dir);

		$_categories = array();
		if ($categories = $this->gallery_categories_m->order_by('title')->get_all())
		{
			foreach ($categories as $category)
			{
				$_categories[$category->id] = $category->title;
			}
		}

		$this->template
			->set('categories', $_categories);
	}
	
	public function index()
	{
		if ($this->core->is_ajax()) {
		
			if ($this->input->get('cmd') == 'load_data_list') {
			
				$per_page = Settings::get('records_per_page');
				$offset = $this->uri->segment(4) ? $this->uri->segment(4) : 0;
				$search = $this->input->get('query');
				$order = $this->input->get('order');
				$sort = $this->input->get('sort');
				
				$where = "
					WHERE UPPER(title) LIKE '%".strtoupper($search)."%'
				";
				
				$sql = "
					SELECT
						gallery.id,
						gallery.title,
						gallery.description,
						gallery.status,
						gallery.image,
						gallery.created_on,
						gallery.updated_on,
						usr1.username AS created_by,
						usr2.username AS updated_by,
						CASE WHEN gallery.updated_on IS NOT NULL THEN gallery.updated_on ELSE gallery.created_on END AS ord
					FROM ".$this->db->dbprefix('gallery')." gallery
					LEFT JOIN ".$this->db->dbprefix('users')." usr1 ON usr1.id = gallery.created_by
					LEFT JOIN ".$this->db->dbprefix('users')." usr2 ON usr2.id = gallery.updated_by
					{$where}
					ORDER BY ord DESC
				";
				
				$query = $this->db->query($sql);
				
				$total_rows = $query->num_rows();
				
				/*if ($order) {
					$sql .= " ORDER BY {$order} {$sort}";
				} else {
					$sql .= " ORDER BY site_id DESC";
				}*/
				
				$sql .= " LIMIT {$per_page} OFFSET {$offset}";
				
				$query = $this->db->query($sql);
				
				$this->load->library('pagination');
				
				$config['base_url'] = site_url('admin/gallery/index');
				$config['total_rows'] = $total_rows;
				$config['per_page'] = $per_page;
				$config['uri_segment'] = 4;
				$config['num_links'] = 5;
				
				$config['full_tag_open'] = '<ul>';
				$config['full_tag_close'] = '</ul>';
				
				$config['cur_tag_open'] = '<li class="active"><span>';
				$config['cur_tag_close'] = '</span></li>';
				
				$config['first_tag_open'] = '<li>';
				$config['first_tag_close'] = '</li>';
				
				$config['last_tag_open'] = '<li>';
				$config['last_tag_close'] = '</li>';

				$config['next_link'] = 'Next &rsaquo;';
				$config['next_tag_open'] = '<li>';
				$config['next_tag_close'] = '</li>';

				$config['prev_link'] = '&lsaquo; Prev';
				$config['prev_tag_open'] = '<li>';
				$config['prev_tag_close'] = '</li>';
				
				$config['num_tag_open'] = '<li>';
				$config['num_tag_close'] = '</li>';
				
				$this->pagination->initialize($config);
				
				$total_rows_perpage = $query->num_rows();
				
				$results = $query->result_array();
				$rows = array();
				$i = 1;
				foreach ($results as $res) {
					$res['number'] = ($i + $offset);

					if (file_exists(UPLOAD_PATH.'gallery/'.$res['image']) && is_file(UPLOAD_PATH.'gallery/'.$res['image'])) {
						$image = $this->_gallery_base_file_dir.'/'.$res['image'];
						$res['image'] = $this->_gallery_base_file_url.'/'.$res['image'];
					} else {
						$image = UPLOAD_PATH.'no_image.jpg';
						$res['image'] = base_url($image);
					}

					$res['thumb'] = $this->image_m->resize($image, 70, 70, 'crop');
					
					$rows[] = $res;
					$i++;
				}
				
				$json['total_rows'] = $total_rows;
				$json['rec_info'] = 'Records from '.($total_rows > 0 ? ($offset + 1) : 0).' to '.($offset + $total_rows_perpage).' of '.$total_rows;
				$json['data'] = $rows;
				$json['pagination'] = $this->pagination->create_links();
				
				$sql = str_replace("\t", ' ', $sql);
				$sql = str_replace(array("\n", "\r"), '', $sql);
				$json['sql'] = $sql;
				
				echo json_encode($json);
				exit;
			}
		}
		
		$this->template
			->title($this->module_details['name'], lang('pages:type_id_label'))
			->build('admin/index');
	}
	
	public function add()
	{
		ini_set('post_max_size', '128M');
		ini_set('upload_max_filesize', '128M');

		$this->form_validation->set_rules($this->validation_rules);
		$this->form_validation->set_message(array('required' => '%s must be filled.'));
		
		// Upload image validation
		if ($_FILES) {
			$allowed = array(
				'.jpg',
				'.jpeg',
				'.png',
				'.gif'
			);

			$upload_key = array_keys($_FILES);
					
			if ( ! empty($_FILES[$upload_key[0]]['name']) && $_FILES[$upload_key[0]]['error'] == UPLOAD_ERR_OK) {
				$ext = strtolower(strrchr($_FILES[$upload_key[0]]['name'], '.'));
				if ( ! in_array($ext, $allowed)) {
					$this->form_validation->set_error('Invalid image file format. Allowed formats are '.implode(', ', $allowed));
				}
			}
		}

		if ($this->form_validation->run()) {
		
			$data = array(
				'title' => $this->input->post('title'),
				'description' => $this->input->post('description'),
				'status' => $this->input->post('status'),
				'created_on' => date('Y-m-d H:i:s'),
				'created_by' => $this->session->userdata('user_id')
			);

			$this->db->insert('gallery', $data);

			$id = $this->db->insert_id();

			// Upload image
			if ($_FILES) {
				$upload_key = array_keys($_FILES);
				
				if ( ! empty($_FILES[$upload_key[0]]['name']) && $_FILES[$upload_key[0]]['error'] == UPLOAD_ERR_OK) {
					$tmp_name = $_FILES[$upload_key[0]]['tmp_name'];
					$ext = strtolower(strrchr($_FILES[$upload_key[0]]['name'], '.'));
					$img_file_name = 'IMG_'.date('Ymd_His').$ext;
					
					if (@move_uploaded_file($tmp_name, $this->_gallery_base_file_dir.'/'.$img_file_name)) {
						$this->db->update('gallery', array('image' => $img_file_name), array('id' => $id));
					}
				}
			}
			
			$this->session->set_flashdata('success', lang('gallery:post_add_success'));
			
			redirect('admin/gallery');
		
		} else {
			$post = new stdClass;
			foreach ($this->validation_rules as $key => $field) {
				$post->$field['field'] = set_value($field['field']);
			}
		}
		
		$this->template
			->title($this->module_details['name'], lang('pages:type_id_label'))
			->append_metadata($this->load->view('fragments/wysiwyg', array(), true))
			->set('post', $post)
			->build('admin/form');
	}
	
	public function edit($id = 0)
	{
		$id OR redirect('admin/gallery');

		ini_set('post_max_size', '128M');
		ini_set('upload_max_filesize', '128M');

		$post = $this->db
			->where('id', $id)
			->get('gallery')
			->row();

		$this->form_validation->set_rules($this->validation_rules);
		$this->form_validation->set_message(array('required' => '%s must be filled.'));
		
		// Upload image validation
		if ($_FILES) {
			$allowed = array(
				'.jpg',
				'.jpeg',
				'.png',
				'.gif'
			);

			$upload_key = array_keys($_FILES);
					
			if ( ! empty($_FILES[$upload_key[0]]['name']) && $_FILES[$upload_key[0]]['error'] == UPLOAD_ERR_OK) {
				$ext = strtolower(strrchr($_FILES[$upload_key[0]]['name'], '.'));
				if ( ! in_array($ext, $allowed)) {
					$this->form_validation->set_error('Invalid image file format. Allowed formats are '.implode(', ', $allowed));
				}
			}
		}

		if ($this->form_validation->run()) {
		
			$data = array(
				'title' => $this->input->post('title'),
				'description' => $this->input->post('description'),
				'status' => $this->input->post('status'),
				'updated_on' => date('Y-m-d H:i:s'),
				'updated_by' => $this->session->userdata('user_id')
			);

			$this->db->update('gallery', $data, array('id' => $id));

			// Upload image
			if ($_FILES) {
				$upload_key = array_keys($_FILES);
				
				if ( ! empty($_FILES[$upload_key[0]]['name']) && $_FILES[$upload_key[0]]['error'] == UPLOAD_ERR_OK) {
					$tmp_name = $_FILES[$upload_key[0]]['tmp_name'];
					$ext = strtolower(strrchr($_FILES[$upload_key[0]]['name'], '.'));
					$img_file_name = 'IMG_'.date('Ymd_His').$ext;
					
					if (@move_uploaded_file($tmp_name, $this->_gallery_base_file_dir.'/'.$img_file_name)) {
						@unlink($this->_gallery_base_file_dir.'/'.$post->file);

						$this->db->update('gallery', array('image' => $img_file_name), array('id' => $id));
					}
				}
			}
			
			$this->session->set_flashdata('success', lang('gallery:post_add_success'));
			
			redirect('admin/gallery');
		}

		if (file_exists(UPLOAD_PATH.'gallery/'.$post->image) && is_file(UPLOAD_PATH.'gallery/'.$post->image)) {
			$image = $this->_gallery_base_file_dir.'/'.$post->image;

			$this->load->model('files/image_m');

			$post->image = $this->_gallery_base_file_url.'/'.$post->image;
			$post->thumb = $this->image_m->resize($image, 70, 70, 'crop');
		}

		$this->template
			->title($this->module_details['name'], lang('pages:type_id_label'))
			->append_metadata($this->load->view('fragments/wysiwyg', array(), true))
			->set('post', $post)
			->build('admin/form');
	}
	
	public function delete($id = 0)
	{
		$id OR redirect('admin/gallery');

		$post = $this->db
			->where('id', $id)
			->get('gallery')
			->row();

		@unlink($this->_gallery_base_file_dir.'/'.$post->file);
		@unlink($this->_gallery_base_file_dir.'/'.$post->image);

		$this->db->delete('gallery', array('id' => $id));
		
		$this->session->set_flashdata('success', lang('gallery:gallery_delete_success'));
		
		redirect('admin/gallery');
	}
}