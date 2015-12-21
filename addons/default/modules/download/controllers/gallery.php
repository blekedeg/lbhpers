<?php

class Gallery extends Public_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array('gallery_m', 'files/image_m'));
	}
	
	public function index()
	{
		$posts = $this->gallery_m->get_all();

		foreach ($posts as $post) {
			if (file_exists(UPLOAD_PATH.'gallery/'.$post->image) && is_file(UPLOAD_PATH.'gallery/'.$post->image)) {
				$image = UPLOAD_PATH.'gallery/'.$post->image;
				$post->image = base_url(UPLOAD_PATH.'gallery/'.$post->image);
			} else {
				$image = UPLOAD_PATH.'no_image.jpg';
				$post->image = base_url($image);
			}

			$post->thumb = $this->image_m->resize($image, 154, 110, 'crop');
		}
//print_rr($posts);
		
		$this->template
			->title($this->module_details['name'])
			->set('posts', $posts)
			->build('index', array('page' => array(
				'title' => 'Foto'
			)));
	}

	public function view($id = 0)
	{
		if ( ! $id) {
			redirect('gallery');
		}

		$id = $this->core->decode($id);

		$post = $this->gallery_m->get_by_id($id);

		$post->date = indonesian_date($post->created_on);
		$post->video = base_url(UPLOAD_PATH.'gallery/'.$post->file);

		$this->template
			->title($this->module_details['name'])
			->set('post', array($post))
			->build('view', array('page' => array(
				'title' => 'Gallery'
			)));
	}
}