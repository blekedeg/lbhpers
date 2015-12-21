<?php

class Pengaduan extends Public_Controller {

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
		
		$this->load->model('pengaduan_m');

		$this->lang->load('pengaduan');
	}
	
	public function index()
	{
		redirect('pengaduan/create');

		$this->template
			->title($this->module_details['name'])
			->build('index', array('page' => array(
				'title' => 'Pengaduan'
			)));
	}

	public function create()
	{
		$post = new stdClass();

		$this->form_validation->set_rules($this->validation_rules);
		$this->form_validation->set_message(array('required' => '%s harus diisi.'));

		if ($this->form_validation->run()) {
		
			$data = array(
				'name' => $this->input->post('name'),
				'email' => $this->input->post('email'),
				'subject' => $this->input->post('subject'),
				'description' => $this->input->post('description'),
				'status' => $this->input->post('status'),
				'created_on' => date('Y-m-d H:i:s'),
				'created_by' => NULL
			);

			$this->db->insert('pengaduan', $data);

			$this->session->set_flashdata('success', lang('pengaduan:post_add_success'));

			redirect('pengaduan/create');
		
		} else {
			foreach ($this->validation_rules as $key => $field) {
				$post->$field['field'] = set_value($field['field']);
			}
		}

		$this->template
			->title($this->module_details['name'])
			->set('post', $post)
			->build('create', array('page' => array(
				'title' => 'Pengaduan'
			)));
	}

	public function view($id = 0)
	{
		if ( ! $id) {
			redirect('pengaduan');
		}

		$id = $this->core->decode($id);

		$post = $this->videos_m->get_by_id($id);

		$post->date = indonesian_date($post->created_on);
		$post->video = base_url(UPLOAD_PATH.'videos/'.$post->file);

		$this->template
			->title($this->module_details['name'])
			->set('post', array($post))
			->build('view', array('page' => array(
				'title' => 'Pengaduan'
			)));
	}
}