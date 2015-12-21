<?php

class Kasus extends Public_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array('kasus_m', 'kasus_categories_m'));
		$this->load->model('files/image_m');

		$this->load->library(array('keywords/keywords'));
		
		$this->lang->load(array('kasus', 'kasus_categories'));

		$this->load->driver('Streams');

		// We are going to get all the categories so we can
		// easily access them later when processing posts.
		$cates = $this->db->get('kasus_categories')->result_array();
		$this->categories = array();
	
		foreach ($cates as $cate)
		{
			$this->categories[$cate['id']] = $cate;
		}

		// Get news stream. We use this to set the template
		// stream throughout the news module.
		$this->stream = $this->streams_m->get_stream('kasus', true, 'kasus');
	}
	
	public function index()
	{
		// Get the latest news posts
		$params = array(
			'stream'		=> 'kasus',
			'namespace'		=> 'kasus',
			'limit'			=> Settings::get('records_per_page'),
			'where'			=> "`status` = 1",
			'paginate'		=> 'yes',
			'pag_base'		=> site_url('kasus/page'),
			'pag_segment'   => 3
		);
		$posts = $this->streams->entries->get_entries($params);

		// Process posts
		foreach ($posts['entries'] as &$post)
		{
			$post['date'] = indonesian_date(date('Y-m-d H:i:s', strtotime($post['created_on'])));

			if (file_exists(UPLOAD_PATH.'kasus/'.$post['image']) && is_file(UPLOAD_PATH.'kasus/'.$post['image'])) {
				$image = UPLOAD_PATH.'kasus/'.$post['image'];
			} else {
				$image = UPLOAD_PATH.'no_image.jpg';
			}
			
			//$post['thumb_100x100'] = $this->image_m->resize($image, 100, 100, 'crop');
			$post['thumb'] = $this->image_m->resize($image, 100, 100, 'crop');

			$this->_process_post($post);
		}

		// Set meta description based on post titles
		$meta = $this->_posts_metadata($posts['entries']);

		$data = array(
			'pagination' => $posts['pagination'],
			'posts' => $posts['entries']
		);

		$this->template
			->title($this->module_details['name'])
			->set_breadcrumb(lang('kasus:kasus_title'))
			->set_metadata('og:title', $this->module_details['name'], 'og')
			->set_metadata('og:type', 'kasus', 'og')
			->set_metadata('og:url', current_url(), 'og')
			->set_metadata('og:description', $meta['description'], 'og')
			->set_metadata('description', $meta['description'])
			->set_metadata('keywords', $meta['keywords'])
			->set_stream($this->stream->stream_slug, $this->stream->stream_namespace)
			->set('posts', $posts['entries'])
			->set('pagination', $posts['pagination'])
			->build('posts', array('page' => array('title' => lang('kasus:kasus_title'))));
	}

	/**
	 * Lists the posts in a specific category.
	 *
	 * @param string $slug The slug of the category.
	 */
	public function category($slug = '')
	{
		$slug or redirect('kasus');

		// Get category data
		$category = $this->kasus_categories_m->get_by('slug', $slug) OR show_404();

		// Get the kasus posts
		$params = array(
			'stream'		=> 'kasus',
			'namespace'		=> 'kasus',
			'limit'			=> Settings::get('records_per_page'),
			'where'			=> "`status` = 1 AND `category_id` = '{$category->id}'",
			'paginate'		=> 'yes',
			'pag_segment'	=> 4
		);
		$posts = $this->streams->entries->get_entries($params);

		// Process posts
		foreach ($posts['entries'] as &$post)
		{
			$post['date'] = indonesian_date(date('Y-m-d H:i:s', strtotime($post['created_on'])));

			if (file_exists(UPLOAD_PATH.'kasus/'.$post['image']) && is_file(UPLOAD_PATH.'kasus/'.$post['image'])) {
				$image = UPLOAD_PATH.'kasus/'.$post['image'];
			} else {
				$image = UPLOAD_PATH.'no_image.jpg';
			}
			$post['thumb_100x100'] = $this->image_m->resize($image, 100, 100, 'crop');

			$this->_process_post($post);
		}

		// Set meta description based on post titles
		$meta = $this->_posts_metadata($posts['entries']);

		// Build the page
		$this->template->title($this->module_details['name'], $category->title)
			->set_metadata('description', $category->title.'. '.$meta['description'])
			->set_metadata('keywords', $category->title)
			->set_breadcrumb(lang('kasus:kasus_title'), 'kasus')
			->set_breadcrumb($category->title)
			->set('pagination', $posts['pagination'])
			//->set_stream($this->stream->stream_slug, $this->stream->stream_namespace)
			->set('posts', $posts['entries'])
			->set('category', (array) $category)
			->build('posts', array('page' => array('title' => lang('kasus:kasus_title'))));
	}

	public function show($id = 0, $extra = '')
	{
		if ( ! $id) {
			redirect('kasus');
		}

		$id = $this->core->decode($id);

		$post = new stdClass();

		$post = $this->kasus_m->get_by_id($id);

		if ($post) {
			$post->date = indonesian_date($post->created_on);

			if (file_exists(UPLOAD_PATH.'kasus/'.$post->image) && is_file(UPLOAD_PATH.'kasus/'.$post->image)) {
				$image = UPLOAD_PATH.'kasus/'.$post->image;
			} else {
				$image = UPLOAD_PATH.'no_image.jpg';
			}

			$this->load->model('files/image_m');

			$post->thumb_detail = $this->image_m->resize($image, 200, 150, 'crop');
		}

		$this->template
			->title($this->module_details['name'])
			->set('post', array($post))
			->build('show', array('page' => array(
				'title' => 'kasus'
			)));
	}

	/**
	 * View a post
	 *
	 * @param string $slug The slug of the news post.
	 */
	public function view($id = '')
	{
		// We need a slug to make this work.
		if ( ! $id)
		{
			redirect('kasus');
		}

		$params = array(
			'stream'		=> 'kasus',
			'namespace'		=> 'kasus',
			'limit'			=> 1,
			//'where'			=> "`slug` = '{$slug}'"
			'where'			=> "`id` = '{$id}'"
		);
		$data = $this->streams->entries->get_entries($params);
		$post = (isset($data['entries'][0])) ? $data['entries'][0] : null;

		if ( ! $post or ($post['status'] !== 1 and ! $this->ion_auth->is_admin()))
		{
			redirect('kasus');
		}

		$this->_single_view($post);
	}

	/**
	 * Single View
	 *
	 * Generate a page for viewing a single
	 * news post.
	 *
	 * @access 	private
	 * @param 	array $post The post to view
	 * @return 	void
	 */
	private function _single_view($post)
	{
		// if it uses markdown then display the parsed version
		// if ($post['type'] === 'markdown')
		// {
		// 	$post['body'] = $post['parsed'];
		// }

		$this->session->set_flashdata(array('referrer' => $this->uri->uri_string()));

		$this->template->set_breadcrumb(lang('kasus:kasus_title'), 'kasus');

		if ($post['category_id'] > 0)
		{
			// Get the category. We'll just do it ourselves
			// since we need an array.
			if ($category = $this->db->limit(1)->where('id', $post['category_id'])->get('kasus_categories')->row_array())
			{
				$this->template->set_breadcrumb($category['title'], 'kasus/category/'.$category['slug']);

				// Set category OG metadata			
				$this->template->set_metadata('article:section', $category['title'], 'og');

				// Add to $post
				$post['category'] = $category;
			}
		}

		$this->_process_post($post);

		// Add in OG keywords
		/*foreach ($post['keywords_arr'] as $keyword)
		{
			$this->template->set_metadata('article:tag', $keyword, 'og');
		}*/

		$this->template
			->title($post['title'], lang('kasus:kasus_title'))
			->set_metadata('og:type', 'article', 'og')
			->set_metadata('og:url', current_url(), 'og')
			->set_metadata('og:title', $post['title'], 'og')
			->set_metadata('og:site_name', Settings::get('site_name'), 'og')
			->set_metadata('og:description', $post['preview'], 'og')
			->set_metadata('article:published_time', date(DATE_ISO8601, strtotime($post['created_on'])), 'og')
			->set_metadata('article:modified_time', date(DATE_ISO8601, strtotime($post['updated_on'])), 'og')
			->set_metadata('description', $post['preview'])
			//->set_metadata('keywords', implode(', ', $post['keywords_arr']))
			->set_breadcrumb($post['title'])
			->set_stream($this->stream->stream_slug, $this->stream->stream_namespace)
			->set('post', array($post))
			->build('view', array('page' => array('title' => lang('kasus:kasus_title'))));
	}

	/**
	 * Posts Metadata
	 *
	 * @param array $posts
	 *
	 * @return array keywords and description
	 */
	private function _posts_metadata(&$posts = array())
	{
		$keywords = array();
		$description = array();

		// Loop through posts and use titles for meta description
		if ( ! empty($posts))
		{
			foreach ($posts as &$post)
			{
				if (isset($post['category']) and ! in_array($post['category']['title'], $keywords))
				{
					$keywords[] = $post['category']['title'];
				}

				$description[] = $post['title'];
			}
		}

		return array(
			'keywords' => implode(', ', $keywords),
			'description' => implode(', ', $description)
		);
	}

	/**
	 * Process Post
	 *
	 * Process data that was not part of the 
	 * initial streams call.
	 *
	 * @return 	void
	 */
	private function _process_post(&$post)
	{
		$this->load->helper('text');

		// Keywords array
		// $keywords = Keywords::get($post['keywords']);
		// $formatted_keywords = array();
		// $keywords_arr = array();

		// foreach ($keywords as $key)
		// {
		// 	$formatted_keywords[] 	= array('keyword' => $key->name);
		// 	$keywords_arr[] 		= $key->name;

		// }
		// $post['keywords'] = $formatted_keywords;
		// $post['keywords_arr'] = $keywords_arr;

		// Full URL for convenience.
		$post['url'] = site_url('kasus/'.$post['id'].'/'.date('Y/m/d', strtotime($post['created_on'])).'/'.$post['slug']);

		if (file_exists(UPLOAD_PATH.'kasus/'.$post['image']) && is_file(UPLOAD_PATH.'kasus/'.$post['image'])) {
			$image = UPLOAD_PATH.'kasus/'.$post['image'];
		} else {
			$image = UPLOAD_PATH.'no_image.jpg';
		}

		$this->load->model('files/image_m');

		$post['thumb_detail'] = $this->image_m->resize($image, 200, 150, 'crop');
	
		// What is the preview? If there is a field called intro,
		// we will use that, otherwise we will cut down the news post itself.
		$post['preview'] = (isset($post['short_desc'])) ? $post['short_desc'] : $post['long_desc'];

		// Category
		if ($post['category_id'] > 0 and isset($this->categories[$post['category_id']]))
		{
			$post['category'] = $this->categories[$post['category_id']];
		}
	}

}