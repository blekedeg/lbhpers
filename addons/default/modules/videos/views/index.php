<div class="box">
	<ul class="videos">
		<?php foreach ($videos['data'] as $post) { ?>
		<li>
			<div class="thumb">
				<a href="<?php echo $post->url ?>" class="frm" title="<?php echo $post->title ?>"><img src="<?php echo $post->thumb ?>" /></a>
			</div>
			<div class="title">
				<div class="date-post"><?php echo $post->created_on ?></div>
				<a href="<?php echo $post->url ?>" title="<?php echo $post->title ?>"><?php echo $post->title ?></a>
				<p class="desc"><?php echo $post->description ?></p>
			</div>
			<div class="cl"></div>
		</li>
		<?php } ?>
	</ul>
	
	<div class="pagination"><?php echo $videos['pagination'] ?></div>
</div>