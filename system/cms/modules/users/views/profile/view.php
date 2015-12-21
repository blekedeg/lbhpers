<!-- <h2 class="page-title">{{ user:display_name user_id= _user:id }}</h2> -->


<!-- Container for the user's profile -->
<div id="user_profile_container">
	<?php //echo gravatar($_user->email, 50);?>
	<!-- Details about the user, such as role and when the user was registered -->
	<?php
	$photo_location = FCPATH.'data/profile';
	if (file_exists($photo_location.'/'.$_user->profile['photo']) && is_file($photo_location.'/'.$_user->profile['photo'])) {
		$photo = $photo = $this->image_m->resize($photo_location.'/'.$_user->profile['photo'], 200, 200, 'crop');
	} else {
		$photo = $this->image_m->resize(FCPATH.'data/unknown-person.png', 200, 200, 'crop');
	}
	?>
	<img src="<?php echo $photo ?>" width="200" height="200" class="img-polaroid" />
	
	<div id="user_details">

		<table>
	
			{{# we use _user:id as that is the id passed to this view. Different than the logged in user's user:id #}}
			{{ user:profile_fields user_id= _user:id }}
				{{#   viewing own profile?    are they an admin?        ok it's a regular user, we'll show the non-sensitive items #}}
				{{ if user:id === _user:id or user:group === 'admin' or slug != 'email' and slug != 'first_name' and slug != 'last_name' and slug != 'username' and value }}
					<tr><td><strong>{{ name }}:</strong></td><td>{{ value }}</td></tr>
				{{ endif }}

			{{ /user:profile_fields }}

		</table>

	</div>
	

</div>