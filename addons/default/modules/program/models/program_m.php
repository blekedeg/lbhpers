<?php

class Program_m extends MY_Model {

	public function get_all()
	{
		$this->db
			->where('program.status', 1)
			->select('program.*')
			->order_by('created_on', 'DESC');

		return $this->db->get('program')->result();
	}

	public function get_by_id($id)
	{
		$this->db
			->where('id', $id)
			->where('status', 1)
			->select('program.*');

		return $this->db->get('program')->row();
	}

	public function get_many_by($params = array())
	{
		if ( ! empty($params['month']))
		{
			$this->db->where('MONTH(FROM_UNIXTIME('.$this->db->dbprefix('program').'.created_on))', $params['month']);
		}

		if ( ! empty($params['year']))
		{
			$this->db->where('YEAR(FROM_UNIXTIME('.$this->db->dbprefix('program').'.created_on))', $params['year']);
		}

		if ( ! empty($params['keywords']))
		{
			$this->db
				->like('program.title', trim($params['keywords']));
		}

		// Is a status set?
		if ( ! empty($params['status']))
		{
			// If it's all, then show whatever the status
			if ($params['status'] != 'all')
			{
				// Otherwise, show only the specific status
				$this->db->where('status', $params['status']);
			}
		}

		// Nothing mentioned, show live only (general frontend stuff)
		else
		{
			$this->db->where('status', 1);
		}

		// By default, dont show future posts
		if ( ! isset($params['show_future']) || (isset($params['show_future']) && $params['show_future'] == false))
		{
			$this->db->where('program.created_on <=', date('Y-m-d H:i:s', now()));
		}

		// Limit the results based on 1 number or 2 (2nd is offset)
		if (isset($params['limit']) && is_array($params['limit']))
		{
			$this->db->limit($params['limit'][0], $params['limit'][1]);
		}
		elseif (isset($params['limit']))
		{
			$this->db->limit($params['limit']);
		}
	
		return $this->get_all();
	}

	/**
	 * Process Post
	 *
	 * Process data that was not part of the 
	 * initial streams call.
	 *
	 * @return 	void
	 */
	public function process_post(&$post)
	{
		$this->load->helper('text');

		// Keywords array
		/*$keywords = Keywords::get($post->keywords);
		$formatted_keywords = array();
		$keywords_arr = array();

		foreach ($keywords as $key)
		{
			$formatted_keywords[] 	= array('keyword' => $key->name);
			$keywords_arr[] 		= $key->name;

		}
		$post->keywords = $formatted_keywords;
		$post->keywords_arr = $keywords_arr;*/

		// Full URL for convenience.
		//$post->url = site_url('program/'.date('Y/m/d', $post->created_on).'/'.$post->slug);
		$slug = url_title($post->title, 'dash', TRUE);
		$post->url = site_url('program/'.date('Y/m/d', strtotime($post->created_on)).'/'.$slug);
	
		// What is the preview? If there is a field called intro,
		// we will use that, otherwise we will cut down the news post itself.
		//$post->preview = (isset($post->intro)) ? $post->intro : $post->body;

		// Category
		/*if ($post->category_id > 0 and isset($this->categories[$post->category_id]))
		{
			$post->category = $this->categories[$post->category_id];
		}*/
	}
}