	<table cellspacing="0">
		<thead>
			<tr>
				<th width="20"><?php echo form_checkbox(array('name' => 'action_to_all', 'class' => 'check-all')) ?></th>
				<th><?php echo lang('alert:post_label') ?></th>
				<!-- <th class="collapse"><?php //echo lang('alert:category_label') ?></th> -->
				<th class="collapse"><?php echo lang('alert:date_label') ?></th>
				<th class="collapse"><?php echo lang('alert:written_by_label') ?></th>
				<th><?php echo lang('alert:status_label') ?></th>
				<th width="180"><?php echo lang('global:actions') ?></th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($alert as $post) : ?>
				<tr>
					<td><?php echo form_checkbox('action_to[]', $post->id) ?></td>
					<td><?php echo $post->title ?></td>
					<!-- <td class="collapse"><?php //echo $post->category_title ?></td> -->
					<td class="collapse"><?php echo format_date($post->created_on) ?></td>
					<td class="collapse">
					<?php if (isset($post->display_name)): ?>
						<?php echo anchor('user/'.$post->username, $post->display_name, 'target="_blank"') ?>
					<?php else: ?>
						<?php echo lang('alert:author_unknown') ?>
					<?php endif ?>
					</td>
					<td><?php echo lang('alert:'.$post->status.'_label') ?></td>
					<td style="padding-top:10px;">
                        <?php if($post->status=='live') : ?>
							<a href="<?php echo site_url('alert/'.date('Y/m/d', $post->created_on).'/'.$post->slug) ?>" title="<?php echo lang('global:view')?>" class="button" target="_blank"><?php echo lang('global:view')?></a>
                        <?php else: ?>
							<a href="<?php echo site_url('alert/preview/' . $post->preview_hash) ?>" title="<?php echo lang('global:preview')?>" class="button" target="_blank"><?php echo lang('global:preview')?></a>
                        <?php endif ?>
						<a href="<?php echo site_url('admin/alert/edit/' . $post->id) ?>" title="<?php echo lang('global:edit')?>" class="button"><?php echo lang('global:edit')?></a>
						<a href="<?php echo site_url('admin/alert/delete/' . $post->id) ?>" title="<?php echo lang('global:delete')?>" class="button confirm"><?php echo lang('global:delete')?></a>
					</td>
				</tr>
			<?php endforeach ?>
		</tbody>
	</table>

	<?php $this->load->view('admin/partials/pagination') ?>

	<br>

	<div class="table_action_buttons">
		<?php $this->load->view('admin/partials/buttons', array('buttons' => array('delete', 'publish'))) ?>
	</div>