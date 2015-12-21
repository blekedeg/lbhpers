<div class="box">
	<ul class="gallery">
		<?php foreach ($posts as $post) { ?>
		<li>
			<a class="image-box" href="<?php echo $post->image ?>" class="frm" title="<?php echo $post->title ?>" data-desc="<?php echo $post->description ?>"><img src="<?php echo $post->thumb ?>" /></a>
			<a class="image-box" href="<?php echo $post->image ?>" title="<?php echo $post->title ?>" data-desc="<?php echo $post->description ?>"><?php echo $post->title ?></a>
		</li>
		<?php } ?>
	</ul>
	<div class="cl"></div>
</div>

<link href="js/fancybox/jquery.fancybox.css" rel="stylesheet" />
<script src="js/fancybox/jquery.fancybox.pack.js"></script>
<script>
$(function() {
	for (var i = 0; i < document.getElementsByClassName('image-box').length; i++) {
		$(document.getElementsByClassName('image-box')[i]).fancybox({
			type: "image",
			openEffect: "elastic",
			closeEffect: "elastic",
			title: '\
				<h3>' + document.getElementsByClassName('image-box')[i].title + '</h3>\
				<p style="padding-top:10px">' + document.getElementsByClassName('image-box')[i].getAttribute('data-desc') + '</p>\
			',
			helpers: {
				title: {
					type : 'inside'
				}
			}
		});
	}
});
</script>