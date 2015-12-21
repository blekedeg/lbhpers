<?php

class Abc extends MY_Controller {
	
	public function __construct()
	{
		parent::__construct();
		
		$this->load->library('form_validation');
	}
	
	protected $validation_rules = array(
		array(
			'field' => 'name',
			'label' => 'Name',
			'rules' => 'trim|required|callback__check_name'
		),
	);
	
	public function index()
	{
		//$_POST['name'] = $_GET['name'];
		
		$this->form_validation->set_rules('name', 'Name', 'required|callback__check_name');
		//$this->form_validation->set_rules($this->validation_rules);
		$this->form_validation->set_error_delimiters('', '');
		
		if ($this->form_validation->run()) {
			
			redirect('news/abc');
		} else {//die('ok');
			print_r(validation_errors());
		}
		?>
		
		<form method="post">
			<input type="text" name="name" />
			<input type="submit" value="Submit" />
		</form>
		
		<?php
	}
	
	public function _check_name($name)
	{
		if ($name != 'abc') {
			return TRUE;
		}
		
		$this->form_validation->set_message('_check_name', 'Name is already exist.');
		return FALSE;
	}
}