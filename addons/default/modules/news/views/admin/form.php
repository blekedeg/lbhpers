<section class="title">
<?php if ($this->method == 'create'): ?>
	<h4><?php echo lang('news:create_title') ?></h4>
<?php else: ?>
	<h4><?php echo sprintf(lang('news:edit_title'), $post->title) ?></h4>
<?php endif ?>
</section>

<section class="item">
	<div class="content">

		<?php echo form_open_multipart() ?>

		<div class="form_inputs">
			<fieldset>
				<ul>
					<li>
						<label for="title"><?php echo lang('global:title') ?> <span>*</span></label>
						<div class="input"><?php echo form_input('title', htmlspecialchars_decode($post->title), 'size="100" id="title"') ?></div>
					</li>

					<li>
						<label for="slug"><?php echo lang('global:slug') ?> <span>*</span></label>
						<div class="input"><?php echo form_input('slug', $post->slug, 'size="100" class="width-20"') ?></div>
					</li>

					<li>
						<label for="category_id"><?php echo lang('news:category_label') ?></label>
						<div class="input">
						<?php echo form_dropdown('category_id', array(lang('news:no_category_select_label')) + $categories, @$post->category_id) ?>
							[ <?php echo anchor('admin/news/categories/create', lang('news:new_category_label'), 'target="_blank"') ?> ]
						</div>
					</li>

					<?php if ( ! module_enabled('keywords')): ?>
						<?php echo form_hidden('keywords'); ?>
					<?php else: ?>
						<li>
							<label for="keywords"><?php echo lang('global:keywords') ?></label>
							<div class="input"><?php echo form_input('keywords', $post->keywords, 'id="keywords"') ?></div>
						</li>
					<?php endif; ?>

					<li class="date-meta">
						<label><?php echo lang('news:date_label') ?></label>

						<div class="input datetime_input">
							<?php echo form_input('created_on', date('Y-m-d', $post->created_on), 'maxlength="10" id="datepicker" class="text width-20"') ?> &nbsp;
							<?php echo form_dropdown('created_on_hour', $hours, date('H', $post->created_on)) ?> :
							<?php echo form_dropdown('created_on_minute', $minutes, date('i', ltrim($post->created_on, '0'))) ?>
						</div>
					</li>

					<li>
						<label for="intro"><?php echo lang('news:intro_label') ?> <span>*</span></label>
						<div class="input"><?php echo form_textarea('intro', $post->intro, 'id="intro"') ?></div>
					</li>

					<li class="editor" style="padding:0 0 10px 0 !important; margin:0 0 10px 0 !important;">
						<label for="body"><?php echo lang('news:content_label') ?> <span>*</span></label><br>
						<div class="input small-side">
							<?php echo form_dropdown('type', array(
								'html' => 'html',
								'markdown' => 'markdown',
								'wysiwyg-simple' => 'wysiwyg-simple',
								'wysiwyg-advanced' => 'wysiwyg-advanced',
							), $post->type) ?>
						</div>

						<div class="edit-content">
							<?php echo form_textarea(array('id' => 'body', 'name' => 'body', 'value' => $post->body, 'rows' => 30, 'class' => $post->type)) ?>
						</div>
					</li>

					<li>
						<label for="status"><?php echo lang('news:status_label') ?></label>
						<div class="input"><?php echo form_dropdown('status', array('draft' => lang('news:draft_label'), 'live' => lang('news:live_label')), $post->status) ?></div>
					</li>

					<?php if ( ! module_enabled('comments')): ?>
						<?php echo form_hidden('comments_enabled', 'no'); ?>
					<?php else: ?>
						<li>
							<label for="comments_enabled"><?php echo lang('news:comments_enabled_label');?></label>
							<div class="input">
								<?php echo form_dropdown('comments_enabled', array(
									'no' => lang('global:no'),
									'1 day' => lang('global:duration:1-day'),
									'1 week' => lang('global:duration:1-week'),
									'2 weeks' => lang('global:duration:2-weeks'),
									'1 month' => lang('global:duration:1-month'),
									'3 months' => lang('global:duration:3-months'),
									'always' => lang('global:duration:always'),
								), $post->comments_enabled ? $post->comments_enabled : '3 months') ?>
							</div>
						</li>
					<?php endif; ?>

					<li>
					<label>Image</label>
					<?php echo form_upload('image') ?>

					<?php if ($this->method == 'edit' && ! empty($post->thumb)) { ?>
					<br /><a href="<?php echo $post->image ?>" class="modal cboxElement"><img src="<?php echo $post->thumb ?>" /></a>
					<?php } ?>
				</li>

				</ul>
			<?php echo form_hidden('preview_hash', $post->preview_hash)?>
			</fieldset>
		</div>

		<input type="hidden" name="row_edit_id" value="<?php if ($this->method != 'create'): echo $post->id; endif; ?>" />

		<div class="buttons">
			<?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'save_exit', 'cancel'))) ?>
		</div>

		<?php echo form_close() ?>

	</div>
</section>