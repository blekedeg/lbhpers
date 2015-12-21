<?php foreach($post as $p) { ?>
	<div style="background:#ddd; margin:0 0 10px 0; padding: 10px; border-radius:10px;">
		<h4><a href="<?php echo site_url('/news/'.date('Y/m/d', strtotime($p['created'])).'/'.$p['slug']) ?>"><?php echo $p['title'] ?></a></h4>
		<span class="date"><?php echo indonesian_date($p['created']) ?></span>
		
		<p style="margin:0 0 20px 0; width:auto;"><?php echo $p['intro'] ?> <br /><br />
		<a href="<?php echo site_url('/news/'.date('Y/m/d', strtotime($p['created'])).'/'.$p['slug']) ?>" class="btn btn-small btn-info" style="color:#fff;">Baca selengkapnya</a>
		</p>
		<div style="clear:both;"></div>
	</div>
<?php } ?>