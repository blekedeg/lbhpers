<section class="title">
<?php if ($this->method == 'edit') { ?>
	<h4>Edit Pengaduan</h4>
<?php } else { ?>
	<h4>Add Pengaduan</h4>
<?php } ?>
</section>

<section class="item">
	<div class="content">
	
		<?php echo form_open_multipart() ?>
		
		<div class="form_inputs">
			<ul>
				<li>
					<label for="name">Name <span>*</span></label>
					<div class="input"><?php echo form_input('name', $post->name, 'id="name" size="50"') ?></div>
				</li>
				<li>
					<label for="email">Email <span>*</span></label>
					<div class="input"><?php echo form_input('email', $post->email, 'id="email" size="50"') ?></div>
				</li>
				<li>
					<label for="subject">Subject <span>*</span></label>
					<div class="input"><?php echo form_input('subject', $post->subject, 'id="subject" size="50"') ?></div>
				</li>
				<li class="editor">
					<label for="description">Description <span>*</span></label><br>
					<div class="edit-content">
						<?php echo form_textarea(array('id' => 'description', 'name' => 'description', 'value' => $post->description, 'rows' => 30, 'class' => 'wysiwyg-simple')) ?>
					</div>
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