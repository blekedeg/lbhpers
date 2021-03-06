{{ post }}

<div class="post">

	<h3>{{ title }}</h3>
	<div class="date-post"><?php echo indonesian_date(date('Y-m-d H:i:s', $post[0]['created_on'])) ?></div>

	<!--
	<div class="meta">
		<div class="date">
			{{ helper:lang line="blog:posted_label" }}
			<span>{{ helper:date timestamp=created_on }}</span>
		</div>

		<div class="author">
			{{ helper:lang line="blog:written_by_label" }}
			<span><a href="{{ url:site }}user/{{ created_by:user_id }}">{{ created_by:display_name }}</a></span>
		</div>

		{{ if category }}
		<div class="category">
			{{ helper:lang line="blog:category_label" }}
			<span><a href="{{ url:site }}alert/category/{{ category:slug }}">{{ category:title }}</a></span>
		</div>
		{{ endif }}

		{{ if keywords }}
		<div class="keywords">
			{{ keywords }}
				<span><a href="{{ url:site }}alert/tagged/{{ keyword }}">{{ keyword }}</a></span>
			{{ /keywords }}
		</div>
		{{ endif }}
		

	</div>
	-->
	
	<div class="body">
		<img src="{{ thumb_detail }}" style="float:left; margin:7px 10px 5px 0;" />
		<span>{{ body }}</span>
		<div class="cl"></div>
	</div>

</div>

{{ /post }}

<?php if (Settings::get('enable_comments')): ?>

<div id="comments">

	<div id="existing-comments">
		<h4><?php echo lang('comments:title') ?></h4>
		<?php echo $this->comments->display() ?>
	</div>

	<?php if ($form_display): ?>
		<?php echo $this->comments->form() ?>
	<?php else: ?>
	<?php echo sprintf(lang('blog:disabled_after'), strtolower(lang('global:duration:'.str_replace(' ', '-', $post[0]['comments_enabled'])))) ?>
	<?php endif ?>
</div>

<?php endif ?>