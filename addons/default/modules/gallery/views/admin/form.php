<section class="title">
<?php if ($this->method == 'edit') { ?>
	<h4>Edit Photo</h4>
<?php } else { ?>
	<h4>Add Photo</h4>
<?php } ?>
</section>

<section class="item">
	<div class="content">
	
		<?php echo form_open_multipart() ?>
		
		<div class="form_inputs">
			<ul>
				<li>
					<label for="title">Title <span>*</span></label>
					<div class="input"><?php echo form_input('title', $post->title, 'id="title" size="50"') ?></div>
				</li>
				<li>
					<label for="category_id">Category <span>*</span></label>
					<div class="input">
						<?php
						$options = array(0 => '- Choose one -');
						foreach ($categories as $k => $v) {
							$options[$k] = $v;
						}
						
						echo form_dropdown('category_id', $options, $post->category_id, 'id="category_id"');
						?>
					</div>
				</li>
				<li class="editor">
					<label for="description">Description <span>*</span></label><br>
					<div class="edit-content">
						<?php echo form_textarea(array('id' => 'description', 'name' => 'description', 'value' => $post->description, 'rows' => 30, 'class' => 'wysiwyg-simple')) ?>
					</div>
				</li>
				<li>
					<label for="image">Image <span>*</span></label>
					<div class="input"><?php echo form_upload('image') ?></div>

					<?php if ($this->method == 'edit' && ! empty($post->thumb)) { ?>
					<br /><a href="<?php echo $post->image ?>" class="modal cboxElement"><img src="<?php echo $post->thumb ?>" /></a>
					<?php } ?>
				</li>
				<li>
					<label for="status">Status <span>*</span></label>
					<div class="input">
						<?php
						$options = array(1 => 'Published', 0 => 'Not Published');
						echo form_dropdown('status', $options, $post->status, 'id="status"') 
						?>
					</div>
				</li>
			</ul>
		</div>
		
		<div class="buttons">
			<?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))) ?>
		</div>
		
		<?php echo form_close() ?>
	
	</div>
</section>