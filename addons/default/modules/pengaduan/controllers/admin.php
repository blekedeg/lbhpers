<?php

class Admin extends Admin_Controller {

	protected $section = 'pengaduan';

	private $_pengaduan_base_file_dir;
	private $_pengaduan_base_file_cache_dir;
	private $_pengaduan_base_file_url;

	protected $validation_rules = array(
		array(
			'field'   => 'name', 
			'label'   => 'Name', 
			'rules'   => 'required'
		),
		array(
			'field'   => 'email', 
			'label'   => 'Email', 
			'rules'   => 'required'
		),
		array(
			'field'   => 'subject',
			'label'   => 'Subject', 
			'rules'   => 'required'
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
		
		$this->lang->load('pengaduan');

		$pengaduan_dir = UPLOAD_PATH.'pengaduan';
		if ( ! is_dir($pengaduan_dir)) {
			mkdir($pengaduan_dir, 0777);
		}

		$this->_pengaduan_base_file_dir = $pengaduan_dir;
		$this->_pengaduan_base_file_cache_dir = $pengaduan_dir;
		$this->_pengaduan_base_file_url = base_url($pengaduan_dir);
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
					WHERE (
						UPPER(name) LIKE '%".strtoupper($search)."%'
						OR
						UPPER(subject) LIKE '%".strtoupper($search)."%'
					)
				";
				
				$sql = "
					SELECT
						pengaduan.id,
						pengaduan.`name`,
						pengaduan.email,
						pengaduan.`subject`,
						pengaduan.`description`,
						pengaduan.`status`,
						pengaduan.created_on,
						pengaduan.updated_on,
						usr1.username AS created_by,
						usr2.username AS updated_by,
						CASE WHEN pengaduan.updated_on IS NOT NULL THEN pengaduan.updated_on ELSE pengaduan.created_on END AS ord
					FROM ".$this->db->dbprefix('pengaduan')." pengaduan
					LEFT JOIN ".$this->db->dbprefix('users')." usr1 ON usr1.id = pengaduan.created_by
					LEFT JOIN ".$this->db->dbprefix('users')." usr2 ON usr2.id = pengaduan.updated_by
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
				
				$config['base_url'] = site_url('admin/pengaduan/index');
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
		ini_set('post_max_size', '128M');
		ini_set('upload_max_filesize', '128M');

		$post = new stdClass();

		$this->form_validation->set_rules($this->validation_rules);
		$this->form_validation->set_message(array('required' => '%s must be filled.'));
		
		// Upload image validation
		if ($_FILES) {
			$allowed = array(
				'.flv',
				'.mp4',
				'.mpg',
				'.mpeg'
			);

			$upload_key = array_keys($_FILES);
					
			if ( ! empty($_FILES[$upload_key[0]]['name']) && $_FILES[$upload_key[0]]['error'] == UPLOAD_ERR_OK) {
				$ext = strtolower(strrchr($_FILES[$upload_key[0]]['name'], '.'));
				if ( ! in_array($ext, $allowed)) {
					$this->form_validation->set_error('Invalid pengaduan file format. Allowed formats are .flv, .mp4, .mpg, .mpeg');
				}
			}
		}

		if ($this->form_validation->run()) {
		
			$data = array(
				'name' => $this->input->post('name'),
				'email' => $this->input->post('email'),
				'subject' => $this->input->post('subject'),
				'description' => $this->input->post('description'),
				'status' => $this->input->post('status'),
				'created_on' => date('Y-m-d H:i:s'),
				'created_by' => $this->session->userdata('user_id')
			);

			$this->db->insert('pengaduan', $data);

			$id = $this->db->insert_id();

			// Upload image
			if ($_FILES) {
				$upload_key = array_keys($_FILES);
				
				if ( ! empty($_FILES[$upload_key[0]]['name']) && $_FILES[$upload_key[0]]['error'] == UPLOAD_ERR_OK) {
					$tmp_name = $_FILES[$upload_key[0]]['tmp_name'];
					$ext = strtolower(strrchr($_FILES[$upload_key[0]]['name'], '.'));
					$vid_file_name = 'VID_'.date('Ymd_His').$ext;
					$img_file_name = 'IMG_'.date('Ymd_His').$ext;
					
					if (move_uploaded_file($tmp_name, $this->_pengaduan_base_file_dir.'/'.$vid_file_name)) {
						unlink($this->_pengaduan_base_file_dir.'/'.$post->file);

						$this->db->update('pengaduan', array('file' => $vid_file_name), array('id' => $id));
					}
				}
			}
			
			$this->session->set_flashdata('success', lang('pengaduan:post_add_success'));
			
			redirect('admin/pengaduan');
		
		} else {
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
		$id OR redirect('admin/pengaduan');

		ini_set('post_max_size', '128M');
		ini_set('upload_max_filesize', '128M');

		$post = $this->db
			->where('id', $id)
			->get('pengaduan')
			->row();

		$this->form_validation->set_rules($this->validation_rules);
		$this->form_validation->set_message(array('required' => '%s must be filled.'));
		
		// Upload image validation
		if ($_FILES) {
			$allowed = array(
				'.flv',
				'.mp4',
				'.mpg',
				'.mpeg'
			);

			$upload_key = array_keys($_FILES);
					
			if ( ! empty($_FILES[$upload_key[0]]['name']) && $_FILES[$upload_key[0]]['error'] == UPLOAD_ERR_OK) {
				$ext = strtolower(strrchr($_FILES[$upload_key[0]]['name'], '.'));
				if ( ! in_array($ext, $allowed)) {
					$this->form_validation->set_error('Invalid pengaduan file format. Allowed formats are .flv, .mp4, .mpg, .mpeg');
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

			$this->db->update('pengaduan', $data, array('id' => $id));

			// Upload image
			if ($_FILES) {
				$upload_key = array_keys($_FILES);
				
				if ( ! empty($_FILES[$upload_key[0]]['name']) && $_FILES[$upload_key[0]]['error'] == UPLOAD_ERR_OK) {
					$tmp_name = $_FILES[$upload_key[0]]['tmp_name'];
					$ext = strtolower(strrchr($_FILES[$upload_key[0]]['name'], '.'));
					$vid_file_name = 'VID_'.date('Ymd_His').$ext;
					$img_file_name = 'IMG_'.date('Ymd_His').$ext;
					
					if (@move_uploaded_file($tmp_name, $this->_pengaduan_base_file_dir.'/'.$vid_file_name)) {
						@unlink($this->_pengaduan_base_file_dir.'/'.$post->file);

						$this->db->update('pengaduan', array('file' => $vid_file_name), array('id' => $id));
					}
				}
			}
			
			$this->session->set_flashdata('success', lang('pengaduan:post_add_success'));
			
			redirect('admin/pengaduan');
		}

		$this->template
			->title($this->module_details['name'], lang('pages:type_id_label'))
			->append_metadata($this->load->view('fragments/wysiwyg', array(), true))
			->set('post', $post)
			->build('admin/form');
	}
	
	public function delete($id = 0)
	{
		$id OR redirect('admin/pengaduan');

		$post = $this->db
			->where('id', $id)
			->get('pengaduan')
			->row();

		@unlink($this->_pengaduan_base_file_dir.'/'.$post->file);
		@unlink($this->_pengaduan_base_file_dir.'/'.$post->image);

		$this->db->delete('pengaduan', array('id' => $id));
		
		$this->session->set_flashdata('success', lang('pengaduan:pengaduan_delete_success'));
		
		redirect('admin/pengaduan');
	}
}