{{ post }}

<div class="page-header">
	<h1>{{ title }}</h1>
	<time class="date-post"><?php echo indonesian_date(date('Y-m-d H:i:s', strtotime($post[0]['created_on']))) ?></time>

	<img src="{{ thumb_detail }}" />
</div>

<div class="content-description">
	<p>{{ short_desc }}</p>
</div>

<div class="content-body">
	{{ long_desc }}
</div>

{{ /post }}