<?php if (validation_errors()) { ?>
<div class="alert alert-error">
	<?php echo validation_errors();?>
</div>
<?php } ?>

<?php echo form_open() ?>
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
				<?php echo form_textarea('description', $post->description, 'class="wysiwyg-simple" style="width:380px; height:150px"') ?>
			</div>
		</li>
		<li>
			<div class="input"><?php echo form_submit('submit', 'Send') ?></div>
		</li>
	</ul>
</div>
<?php echo form_close() ?>