{{ post }}
	
<div class="page-header">
	<h1>{{ title }}</h1>
	<time class="date-post"><?php echo indonesian_date(date('Y-m-d H:i:s', $post[0]['created_on'])) ?></time>

	<img src="{{ thumb_detail }}" />
</div>

<div class="content-description">
	<p>{{ preview }}</p>
</div>

<div class="content-body">
	{{ body }}
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