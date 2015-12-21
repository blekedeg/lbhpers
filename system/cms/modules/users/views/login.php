<style>
.alert {padding:10px !important;}
.alert p {margin:0px !important}
.alert .close {right:0px;}
</style>

<!-- <h2 class="page-title" id="page_title"><?php echo lang('user:login_header') ?></h2> -->



<!--
<?php echo form_open('users/login', array('id'=>'login', 'class' => 'form-horizontal'), array('redirect_to' => $redirect_to)) ?>
<ul style="list-style-type:none; margin-left:0px;">
	<li>
		<label for="email"><?php echo lang('global:email') ?></label>
		<?php echo form_input('email', $this->input->post('email') ? $this->input->post('email') : '', 'class="input-large"')?>
	</li>
	<li>
		<label for="password"><?php echo lang('global:password') ?></label>
		<input type="password" id="password" name="password" maxlength="20" class="input-large" />
	</li>
	<li id="remember_me">
		<label class="checkbox"><?php echo lang('user:remember') ?> <?php echo form_checkbox('remember', '1', false) ?></label>
	</li>
	<li class="form_buttons">
		<input type="submit" value="<?php echo lang('user:login_btn') ?>" name="btnLogin" class="btn" /> <span class="register"> | <?php echo anchor('register', lang('user:register_btn'));?></span>
	</li>
	<li class="reset_pass">
		<?php echo anchor('users/reset_pass', lang('user:reset_password_link'));?>
	</li>
</ul>
<?php echo form_close() ?>
-->

<div class="row-fluid" style="width:600px; margin:0 auto;">
	<?php if (validation_errors()): ?>
	<div class="alert alert-error">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<?php echo validation_errors();?>
	</div>
	<?php endif ?>
	
	<?php echo form_open('users/login', array('id'=>'login', 'class' => 'form-vertical'), array('redirect_to' => $redirect_to)) ?>
	<label for="emailLogin" class="control-label">E-mail</label>
	<?php echo form_input('email', '', 'id="emailLogin" class="span12"') ?>
	<label for="passwordLogin" class="control-label">Password</label>
	<?php echo form_password('password', '', 'id="passwordLogin" class="span12"') ?>
	<button type="submit" name="btnLogin" class="btn btn-info">Login</button>
	<?php echo form_close() ?>
</div>