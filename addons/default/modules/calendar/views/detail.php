<?php 
$post = $data_read;
?>

<div class="page-header">
	<h1><?php echo $post->event_title ?></h1>
	<time class="date-post"><?php echo indonesian_date($post->event_date_begin) ?></time>

	<img src="<?php echo $post->thumb_detail ?>" />
</div>

<div class="content-body">
	<?php echo stripslashes($post->event_content) ?>
</div>