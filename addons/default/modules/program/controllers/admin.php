<?php

class Admin extends Admin_Controller {

	protected $section = 'program';

	private $_program_base_file_dir;
	private $_program_base_file_cache_dir;
	private $_program_base_file_url;

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
			'field'   => 'short_desc', 
			'label'   => 'Description', 
			'rules'   => 'required'
		),
		array(
			'field'   => 'long_desc', 
			'label'   => 'Content', 
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
		
		$this->lang->load(array('program', 'categories'));

		$this->load->model(array('program_m', 'program_categories_m'));

		$program_dir = UPLOAD_PATH.'program';
		if ( ! is_dir($program_dir)) {
			mkdir($program_dir, 0777);
		}
		
		$this->_program_base_file_dir = $program_dir;
		$this->_program_base_file_cache_dir = $program_dir;
		$this->_program_base_file_url = base_url($program_dir);

		$_categories = array();
		if ($categories = $this->program_categories_m->order_by('title')->get_all())
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
						prg.id,
						prg.title,
						prg.short_desc,
						prg.long_desc,
						prg.status,
						prg.created_on,
						prg.updated_on,
						usr1.username AS created_by,
						usr2.username AS updated_by,
						CASE WHEN prg.updated_on IS NOT NULL THEN prg.updated_on ELSE prg.created_on END AS ord
					FROM ".$this->db->dbprefix('program')." prg
					LEFT JOIN ".$this->db->dbprefix('users')." usr1 ON usr1.id = prg.created_by
					LEFT JOIN ".$this->db->dbprefix('users')." usr2 ON usr2.id = prg.updated_by
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
				
				$config['base_url'] = site_url('/admin/program/index');
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
					$res['number'] = ($i+$offset);
					
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
		$this->form_validation->set_rules($this->validation_rules);
		$this->form_validation->set_message(array('required' => '%s must be filled.'));

		// Upload image validation
		if ($_FILES) {
			$allowed = array(
				'.jpg',
				'.jpeg',
				'.gif',
				'.png'
			);

			$upload_key = array_keys($_FILES);
					
			if ( ! empty($_FILES[$upload_key[0]]['name']) && $_FILES[$upload_key[0]]['error'] == UPLOAD_ERR_OK) {
				$ext = strtolower(strrchr($_FILES[$upload_key[0]]['name'], '.'));
				if ( ! in_array($ext, $allowed)) {
					$this->form_validation->set_error('Invalid image file extension. Allowed extension are .jpg, .jpeg, .png, .gif');
				}
			}
		}
		
		$created_on = now();

		if ($this->form_validation->run()) {
		
			// Insert a new news entry.
			// These are the values that we don't pass through streams processing.
			$extra = array(
				'title'         => $this->input->post('title'),
				'category_id'   => $this->input->post('category_id'),
				'short_desc'    => $this->input->post('short_desc'),
				'long_desc'	    => $this->input->post('long_desc'),
				'slug'        	=> url_title(trim($this->input->post('title')), 'dash', TRUE),
				'status'        => $this->input->post('status'),
				'created'		=> date('Y-m-d H:i:s', $created_on),
				'created_on'    => date('Y-m-d H:i:s', $created_on),
				'created_by'	=> $this->session->userdata('user_id')
			);

			if ($id = $this->streams->entries->insert_entry($_POST, 'program', 'programs', array('created'), $extra))
			{
				// Upload image
				if ($_FILES) {
					$upload_key = array_keys($_FILES);
					
					if ( ! empty($_FILES[$upload_key[0]]['name']) && $_FILES[$upload_key[0]]['error'] == UPLOAD_ERR_OK) {
						$tmp_name = $_FILES[$upload_key[0]]['tmp_name'];
						$ext = strtolower(strrchr($_FILES[$upload_key[0]]['name'], '.'));
						$file_name = 'IMG_'.date('Ymd_His').$ext;
						
						if (@move_uploaded_file($tmp_name, $this->_program_base_file_dir.'/'.$file_name)) {
							@unlink($this->_program_base_file_dir.'/'.$post->image);

							$this->db->update('program', array('image' => $file_name), array('id' => $id));
						}
					}
				}

				$this->pyrocache->delete_all('program_m');
				$this->session->set_flashdata('success', sprintf($this->lang->line('program:post_add_success'), $this->input->post('title')));

				// News article has been updated, may not be anything to do with publishing though
				Events::trigger('post_created', $id);

				// They are trying to put this live
				if ($this->input->post('status') == 1)
				{
					// Fire an event, we're posting a new program!
					Events::trigger('post_published', $id);
				}
			}
			else
			{
				$this->session->set_flashdata('error', lang('program:post_add_error'));
			}

			// Redirect back to the form or main page
			($this->input->post('btnAction') == 'save_exit') ? redirect('admin/program') : redirect('admin/program/edit/'.$id);
		}

		$post = new stdClass;
		foreach ($this->validation_rules as $key => $field)
		{
			$post->$field['field'] = set_value($field['field']);
		}
		
		$this->template
			->title($this->module_details['name'], lang('pages:type_id_label'))
			->append_metadata($this->load->view('fragments/wysiwyg', array(), true))
			->set('post', $post)
			->build('admin/form');
	}
	
	public function edit($id = 0)
	{
		$id or redirect('admin/program');

		$post = $this->program_m->get_by_id($id);

		$this->validation_rules = array(
			array(
				'field'   => 'title', 
				'label'   => 'Title', 
				'rules'   => 'required'
			),
			array(
				'field'   => 'short_desc', 
				'label'   => 'Description', 
				'rules'   => 'required'
			),
			array(
				'field'   => 'long_desc', 
				'label'   => 'Content', 
				'rules'   => 'required'
			),
		);

		$this->form_validation->set_rules($this->validation_rules);
		$this->form_validation->set_message(array('required' => '%s must be filled.'));
		
		// Upload image validation
		if ($_FILES) {
			$allowed = array(
				'.jpg',
				'.jpeg',
				'.gif',
				'.png'
			);

			$upload_key = array_keys($_FILES);
					
			if ( ! empty($_FILES[$upload_key[0]]['name']) && $_FILES[$upload_key[0]]['error'] == UPLOAD_ERR_OK) {
				$ext = strtolower(strrchr($_FILES[$upload_key[0]]['name'], '.'));
				if ( ! in_array($ext, $allowed)) {
					$this->form_validation->set_error('Invalid image file extension. Allowed extension are .jpg, .jpeg, .png, .gif');
				}
			}
		}

		if ($this->form_validation->run()) {
		
			$data = array(
				'title' => $this->input->post('title'),
				'category_id'   => $this->input->post('category_id'),
				'short_desc' => $this->input->post('short_desc'),
				'long_desc' => $this->input->post('long_desc'),
				'slug' => url_title(trim($this->input->post('title')), 'dash', TRUE),
				'status' => $this->input->post('status'),
				'updated_on' => date('Y-m-d H:i:s'),
				'updated_by' => $this->session->userdata('user_id')
			);

			$this->db->update('program', $data, array('id' => $id));

			// Upload image
			if ($_FILES) {
				$upload_key = array_keys($_FILES);
				
				if ( ! empty($_FILES[$upload_key[0]]['name']) && $_FILES[$upload_key[0]]['error'] == UPLOAD_ERR_OK) {
					$tmp_name = $_FILES[$upload_key[0]]['tmp_name'];
					$ext = strtolower(strrchr($_FILES[$upload_key[0]]['name'], '.'));
					$file_name = 'IMG_'.date('Ymd_His').$ext;
					
					if (@move_uploaded_file($tmp_name, $this->_program_base_file_dir.'/'.$file_name)) {
						@unlink($this->_program_base_file_dir.'/'.$post->image);

						$this->db->update('program', array('image' => $file_name), array('id' => $id));
					}
				}
			}
			
			$this->session->set_flashdata('success', sprintf($this->lang->line('program:post_add_success'), $this->input->post('title')));
			
			redirect('admin/program');
		}

		if (file_exists(UPLOAD_PATH.'program/'.$post->image) && is_file(UPLOAD_PATH.'program/'.$post->image)) {
			$image = $this->_program_base_file_dir.'/'.$post->image;

			$this->load->model('files/image_m');

			$post->image = $this->_program_base_file_url.'/'.$post->image;
			$post->thumb = $this->image_m->resize($image, 100, 100, 'crop');
		}

		$this->template
			->title($this->module_details['name'], lang('pages:type_id_label'))
			->append_metadata($this->load->view('fragments/wysiwyg', array(), true))
			->set('post', $post)
			->build('admin/form');
	}
	
	public function delete($id = 0)
	{
		$id OR redirect('admin/program');

		$post = $this->db
			->where('id', $id)
			->get('program')
			->row();

		@unlink($this->_program_base_file_dir.'/'.$post->image);

		$this->db->delete('program', array('id' => $id));
		
		$this->session->set_flashdata('success', sprintf($this->lang->line('program:delete_success'), $post->title));
		
		redirect('admin/program');
	}
}