<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); ?>

ERROR - 2015-12-17 14:09:04 --> Query error: Table 'db_press.default_users' doesn't exist in engine - Invalid query: SELECT `default_users`.*, `default_groups`.`name` AS `group`, `default_groups`.`description` AS `group_description`, `default_profiles`.`first_name`, `default_profiles`.`company`, `default_profiles`.`bio`, `default_profiles`.`lang`, `default_profiles`.`dob`, `default_profiles`.`gender`, `default_profiles`.`phone`, `default_profiles`.`mobile`, `default_profiles`.`address_line1`, `default_profiles`.`address_line2`, `default_profiles`.`address_line3`, `default_profiles`.`postcode`, `default_profiles`.`website`, `default_profiles`.`display_name` as `display_name`, `default_profiles`.`updated_on` as `updated_on`, `default_profiles`.`user_id` as `user_id`, `default_profiles`.`id` as `profile_id`
FROM `default_users`
LEFT JOIN `default_profiles` ON `default_users`.`id` = `default_profiles`.`user_id`
LEFT JOIN `default_groups` ON `default_users`.`group_id` = `default_groups`.`id`
WHERE `default_users`.`email` IS NULL
 LIMIT 1
ERROR - 2015-12-17 14:10:06 --> Query error: Table 'db_press.default_migrations' doesn't exist - Invalid query: SELECT `version`
FROM `default_migrations`
ERROR - 2015-12-17 14:25:26 --> Will go ahead and create the following tables: download
ERROR - 2015-12-17 14:25:26 --> -- Creating table: download
ERROR - 2015-12-17 14:25:26 --> All done perfectly!
ERROR - 2015-12-17 14:30:23 --> Severity: Notice  --> Undefined property: CI::$gallery_categories_m D:\htdocs\lbhpers\system\cms\libraries\MX\Controller.php 57
ERROR - 2015-12-17 14:38:45 --> Severity: Notice  --> Use of undefined constant download_dir - assumed 'download_dir' D:\htdocs\lbhpers\addons\default\modules\download\controllers\admin.php 39
ERROR - 2015-12-17 14:38:46 --> Severity: Notice  --> Use of undefined constant download_dir - assumed 'download_dir' D:\htdocs\lbhpers\addons\default\modules\download\controllers\admin.php 39
ERROR - 2015-12-17 14:38:46 --> Query error: Unknown column 'download.id' in 'field list' - Invalid query: 
					SELECT
						download.id,
						download.title,
						download.status,
						download.cover,
						download.file,
						download.created_on,
						download.updated_on,
						usr1.username AS created_by,
						usr2.username AS updated_by,
						CASE WHEN download.updated_on IS NOT NULL THEN download.updated_on ELSE download.created_on END AS ord
					FROM default_gallery gallery
					LEFT JOIN default_users usr1 ON usr1.id = download.created_by
					LEFT JOIN default_users usr2 ON usr2.id = download.updated_by
					
					WHERE UPPER(title) LIKE '%%'
				
					ORDER BY ord DESC
				
ERROR - 2015-12-17 14:39:28 --> Query error: Unknown column 'download.id' in 'field list' - Invalid query: 
					SELECT
						download.id,
						download.title,
						download.status,
						download.cover,
						download.file,
						download.created_on,
						download.updated_on,
						usr1.username AS created_by,
						usr2.username AS updated_by,
						CASE WHEN download.updated_on IS NOT NULL THEN download.updated_on ELSE download.created_on END AS ord
					FROM default_gallery gallery
					LEFT JOIN default_users usr1 ON usr1.id = download.created_by
					LEFT JOIN default_users usr2 ON usr2.id = download.updated_by
					
					WHERE UPPER(title) LIKE '%%'
				
					ORDER BY ord DESC
				
ERROR - 2015-12-17 14:39:39 --> Query error: Unknown column 'download.id' in 'field list' - Invalid query: 
					SELECT
						download.id,
						download.title,
						download.status,
						download.cover,
						download.file,
						download.created_on,
						download.updated_on,
						usr1.username AS created_by,
						usr2.username AS updated_by,
						CASE WHEN download.updated_on IS NOT NULL THEN download.updated_on ELSE download.created_on END AS ord
					FROM default_gallery gallery
					LEFT JOIN default_users usr1 ON usr1.id = download.created_by
					LEFT JOIN default_users usr2 ON usr2.id = download.updated_by
					
					WHERE UPPER(title) LIKE '%%'
				
					ORDER BY ord DESC
				
ERROR - 2015-12-17 14:41:17 --> Severity: Notice  --> Undefined variable: categories D:\htdocs\lbhpers\addons\default\modules\download\views\admin\form.php 25
ERROR - 2015-12-17 14:41:17 --> Severity: Warning  --> Invalid argument supplied for foreach() D:\htdocs\lbhpers\addons\default\modules\download\views\admin\form.php 25
ERROR - 2015-12-17 14:41:17 --> Severity: Notice  --> Undefined property: stdClass::$category_id D:\htdocs\lbhpers\addons\default\modules\download\views\admin\form.php 29
ERROR - 2015-12-17 14:41:17 --> Severity: Notice  --> Undefined property: stdClass::$description D:\htdocs\lbhpers\addons\default\modules\download\views\admin\form.php 36
ERROR - 2015-12-17 14:42:58 --> Severity: Notice  --> Undefined variable: categories D:\htdocs\lbhpers\addons\default\modules\download\views\admin\form.php 25
ERROR - 2015-12-17 14:42:58 --> Severity: Warning  --> Invalid argument supplied for foreach() D:\htdocs\lbhpers\addons\default\modules\download\views\admin\form.php 25
ERROR - 2015-12-17 14:42:58 --> Severity: Notice  --> Undefined property: stdClass::$category_id D:\htdocs\lbhpers\addons\default\modules\download\views\admin\form.php 29
ERROR - 2015-12-17 14:42:58 --> Severity: Notice  --> Undefined property: stdClass::$description D:\htdocs\lbhpers\addons\default\modules\download\views\admin\form.php 36
ERROR - 2015-12-17 14:43:18 --> Severity: Notice  --> Undefined property: stdClass::$description D:\htdocs\lbhpers\addons\default\modules\download\views\admin\form.php 23
ERROR - 2015-12-17 14:51:45 --> Severity: Notice  --> Undefined offset: 1 D:\htdocs\lbhpers\addons\default\modules\download\controllers\admin.php 203
ERROR - 2015-12-17 14:56:33 --> Severity: Notice  --> Undefined property: CI::$image_m D:\htdocs\lbhpers\system\cms\libraries\MX\Controller.php 57
ERROR - 2015-12-17 15:05:58 --> Query error: Unknown column 'download' in 'field list' - Invalid query: UPDATE `default_download` SET `download` = 'cover_20151217_150558.jpg' WHERE `id` =  1
ERROR - 2015-12-17 15:06:53 --> Severity: Notice  --> Undefined property: CI::$_cover_base_file_dir D:\htdocs\lbhpers\system\cms\libraries\MX\Controller.php 57
ERROR - 2015-12-17 15:06:53 --> Severity: Notice  --> Undefined property: CI::$_cover_base_file_url D:\htdocs\lbhpers\system\cms\libraries\MX\Controller.php 57
ERROR - 2015-12-17 15:06:53 --> Severity: Notice  --> Undefined property: CI::$image_m D:\htdocs\lbhpers\system\cms\libraries\MX\Controller.php 57
ERROR - 2015-12-17 15:07:30 --> Severity: Notice  --> Undefined property: CI::$_cover_base_file_dir D:\htdocs\lbhpers\system\cms\libraries\MX\Controller.php 57
ERROR - 2015-12-17 15:07:30 --> Severity: Notice  --> Undefined property: CI::$_cover_base_file_url D:\htdocs\lbhpers\system\cms\libraries\MX\Controller.php 57
ERROR - 2015-12-17 15:07:30 --> Severity: Notice  --> Undefined property: CI::$image_m D:\htdocs\lbhpers\system\cms\libraries\MX\Controller.php 57
ERROR - 2015-12-17 15:09:40 --> Severity: Notice  --> Undefined property: CI::$_cover_base_file_dir D:\htdocs\lbhpers\system\cms\libraries\MX\Controller.php 57
ERROR - 2015-12-17 15:09:40 --> Severity: Notice  --> Undefined property: CI::$_cover_base_file_url D:\htdocs\lbhpers\system\cms\libraries\MX\Controller.php 57
ERROR - 2015-12-17 15:09:40 --> Severity: Notice  --> Undefined property: CI::$image_m D:\htdocs\lbhpers\system\cms\libraries\MX\Controller.php 57
ERROR - 2015-12-17 15:10:50 --> Severity: Notice  --> Undefined property: CI::$image_m D:\htdocs\lbhpers\system\cms\libraries\MX\Controller.php 57
ERROR - 2015-12-17 15:25:19 --> Severity: Notice  --> Undefined property: CI::$_gallery_base_file_dir D:\htdocs\lbhpers\system\cms\libraries\MX\Controller.php 57
ERROR - 2015-12-17 15:25:19 --> Severity: Notice  --> Undefined property: CI::$_gallery_base_file_url D:\htdocs\lbhpers\system\cms\libraries\MX\Controller.php 57
ERROR - 2015-12-17 15:30:30 --> Query error: Unknown column 'description' in 'field list' - Invalid query: UPDATE `default_download` SET `title` = 'test', `description` = NULL, `status` = '1', `updated_on` = '2015-12-17 15:30:30', `updated_by` = '1' WHERE `id` =  '1'
ERROR - 2015-12-17 17:07:43 --> Severity: Warning  --> unlink(data/default/download/IMG_20151217_170308.png): No such file or directory D:\htdocs\lbhpers\addons\default\modules\download\controllers\admin.php 349
ERROR - 2015-12-17 17:12:02 --> Severity: Notice  --> Undefined offset: 3 D:\htdocs\lbhpers\addons\default\modules\download\controllers\admin.php 341
ERROR - 2015-12-17 17:12:02 --> Severity: Notice  --> Undefined index:  D:\htdocs\lbhpers\addons\default\modules\download\controllers\admin.php 341
ERROR - 2015-12-17 17:52:44 --> Severity: Warning  --> unlink(data/default/download/file_20151217_150729.jpg): No such file or directory D:\htdocs\lbhpers\addons\default\modules\download\controllers\admin.php 361
