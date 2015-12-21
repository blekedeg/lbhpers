<?php

class Videos extends Public_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('videos_m');
		$this->load->model('files/image_m');
	}
	
	public function index()
	{
		$per_page = Settings::get('records_per_page');
		$offset = $this->uri->segment(3) ? $this->uri->segment(3) : 0;
		
		$this->db->where('status', 1);

		$num_rows = $this->db->get('videos')->num_rows();
		
		$this->db->order_by('created_on', 'DESC');
		$this->db->limit($per_page, $offset);
		
		$query = $this->db->get('videos');
		
		$this->load->library('pagination');
		
		$config['base_url'] = site_url('videos/page');
		$config['total_rows'] = $num_rows;
		$config['per_page'] = $per_page;
		$config['uri_segment'] = 3;
		$config['num_links'] = 3;
		
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
		
		foreach ($query->result() as $row) {
			$row->created_on = indonesian_date($row->created_on);
			
			$url = 'http://gdata.youtube.com/feeds/api/videos/'.trim($row->video_id).'?v=2&alt=json';
			$handle = curl_init($url);
			curl_setopt($handle,  CURLOPT_RETURNTRANSFER, TRUE);

			/* Get the HTML or whatever is linked in $url. */
			$response = curl_exec($handle);

			/* Check for 404 (file not found). */
			$httpCode = curl_getinfo($handle, CURLINFO_HTTP_CODE);

			if ($httpCode == 200) {
				$json_output = @file_get_contents($url);
				$json_data = json_decode($json_output, TRUE);
				
				$title = $json_data['entry']['title']['$t'];
				$thumb = 'http://img.youtube.com/vi/'.$row->video_id.'/2.jpg';
			} else {
				$title = $row->title;
				$thumb = $this->image_m->resize(UPLOAD_PATH.'no_image.jpg', 154, 110, 'crop');
			}

			curl_close($handle);


			$row->title = $title;
			$row->url = site_url('videos/view/'.$this->core->encode($row->id));
			$row->thumb = $thumb;
		}

		$data['data'] = $query->result();
		$data['pagination'] = $this->pagination->create_links();
		
		$this->template
			->title($this->module_details['name'])
			->set('videos', $data)
			->build('index', array('page' => array(
				'title' => 'Video'
			)));
	}

	public function view($id = 0)
	{
		if ( ! $id) {
			redirect('videos');
		}

		$id = $this->core->decode($id);

		$post = $this->videos_m->get_by_id($id);

		$post->date = indonesian_date($post->created_on);
		//$post->video = base_url(UPLOAD_PATH.'videos/'.$post->file);

		$json_output = @file_get_contents("http://gdata.youtube.com/feeds/api/videos/{$post->video_id}?v=2&alt=json");
		$json = json_decode($json_output, TRUE);
		
		$post->title = $json['entry']['title']['$t'];
		$post->description = $json['entry']['media$group']['media$description']['$t'];

		$this->template
			->title($this->module_details['name'])
			->set('post', array($post))
			->build('view', array('page' => array(
				'title' => 'Video'
			)));
	}
}