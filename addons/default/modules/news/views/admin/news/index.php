<section class="title">
	<h4><?php echo lang('news:news_title') ?></h4>
</section>

<section class="item">
	<div class="content">

	<?php if ($news): ?>
	
		<table border="0" class="table-list" cellspacing="0">
			<thead>
			<tr>
				<th><?php echo lang('news:news_title') ?></th>
				<th><?php echo lang('global:slug') ?></th>
				<th width="120"></th>
			</tr>
			</thead>
			<tbody>
			<?php foreach ($news as $v): ?>
			<tr>
				<td><?php echo lang_label($v->stream_name); ?></td>
				<td><?php echo $v->news_uri; ?></td>
				<td>
					<a href="" class="btn">Edit</a>
					<a href="" class="btn">Delete</a>
					<a href="" class="btn">New Post</a>
				</td>
			</tr>
			<?php endforeach; ?>
			</tbody>
		</table>

		<?php echo form_close() ?>

<?php $this->load->view('admin/partials/pagination') ?>

	<?php else: ?>
		<div class="no_data">No News</div>
	<?php endif ?>
	</div>
</section>