<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); ?>

ERROR - 2015-03-23 22:32:32 --> Severity: Notice  --> Undefined variable: posts D:\www-root\lbhpers\addons\default\modules\program\plugin.php 638
ERROR - 2015-03-23 22:33:04 --> Query error: Unknown column 'default_program_categories.title' in 'field list' - Invalid query: SELECT `default_program_categories`.`title` as 'category_title', `default_program_categories`.`slug` as 'category_slug', `default_program_categories`.`title` as 'category||title', `default_program_categories`.`slug` as 'category||slug', `default_program`.*, `cb_users`.`id` as `created_by||user_id`, `cb_users`.`email` as `created_by||email`, `cb_users`.`username` as `created_by||username`, `profiles`.`display_name` as `created_by||display_name`
		FROM `default_program`
		LEFT JOIN `default_users` as `cb_users` ON `cb_users`.`id`=`default_program`.`created_by` LEFT JOIN `default_profiles` as `profiles` ON `profiles`.`user_id`=`default_program`.`created_by`
		WHERE (`default_program`.`status` = 1) AND `default_program`.`created_on` >= CURDATE()
		
		ORDER BY `default_program`.`created_on` DESC  LIMIT 5
ERROR - 2015-03-23 22:38:46 --> Page Missing: video
ERROR - 2015-03-23 22:41:21 --> Query error: Unknown column 'active' in 'where clause' - Invalid query: SELECT `default_gallery`.*
FROM `default_gallery`
WHERE `active` =  0
ORDER BY `created_on` DESC
ERROR - 2015-03-23 22:44:40 --> invalid_stream [get_entries]
ERROR - 2015-03-23 22:45:01 --> no_stream_provided [get_entries]
ERROR - 2015-03-23 22:45:03 --> no_stream_provided [get_entries]
ERROR - 2015-03-23 23:04:37 --> Severity: Notice  --> Undefined variable: total_rows D:\www-root\lbhpers\addons\default\modules\videos\controllers\videos.php 27
ERROR - 2015-03-23 23:04:37 --> Severity: Notice  --> Undefined variable: query D:\www-root\lbhpers\addons\default\modules\videos\controllers\videos.php 57
ERROR - 2015-03-23 23:05:00 --> Severity: Notice  --> Undefined variable: total_rows D:\www-root\lbhpers\addons\default\modules\videos\controllers\videos.php 27
ERROR - 2015-03-23 23:06:35 --> Query error: Table 'db_press.default_videosz' doesn't exist - Invalid query: SELECT *
FROM `default_videosz`
WHERE `status` =  1
ERROR - 2015-03-23 23:07:18 --> Page Missing: videos/page/1
ERROR - 2015-03-23 23:09:12 --> Severity: Notice  --> Undefined property: CI_DB_mysqli_result::$result D:\www-root\lbhpers\addons\default\modules\videos\controllers\videos.php 18
ERROR - 2015-03-23 23:14:34 --> Page Missing: videos/page/1
ERROR - 2015-03-23 23:15:23 --> Page Missing: videos/page/1
ERROR - 2015-03-23 23:16:38 --> Page Missing: videos/page/1/2
ERROR - 2015-03-23 23:23:21 --> Page Missing: videos/1
ERROR - 2015-03-23 23:23:54 --> Page Missing: videos/1
ERROR - 2015-03-23 23:35:07 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE `status` =  1
 LIMIT 1' at line 2 - Invalid query: SELECT COUNT(*) AS `numrows`
WHERE `status` =  1
 LIMIT 1
ERROR - 2015-03-23 23:35:34 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE `status` =  1' at line 2 - Invalid query: SELECT COUNT(*) AS `numrows`
WHERE `status` =  1
ERROR - 2015-03-23 23:36:23 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE `status` =  1' at line 2 - Invalid query: SELECT COUNT(*) AS `numrows`
WHERE `status` =  1
ERROR - 2015-03-23 23:36:25 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE `status` =  1' at line 2 - Invalid query: SELECT COUNT(*) AS `numrows`
WHERE `status` =  1
ERROR - 2015-03-23 23:36:26 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE `status` =  1' at line 2 - Invalid query: SELECT COUNT(*) AS `numrows`
WHERE `status` =  1
ERROR - 2015-03-23 23:36:26 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE `status` =  1' at line 2 - Invalid query: SELECT COUNT(*) AS `numrows`
WHERE `status` =  1
ERROR - 2015-03-23 23:36:26 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE `status` =  1' at line 2 - Invalid query: SELECT COUNT(*) AS `numrows`
WHERE `status` =  1
ERROR - 2015-03-23 23:36:42 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE `status` =  1
 LIMIT 1' at line 2 - Invalid query: SELECT COUNT(*) AS `numrows`
WHERE `status` =  1
 LIMIT 1
ERROR - 2015-03-23 23:37:02 --> Query error: Table 'db_press.default_videosz' doesn't exist - Invalid query: SELECT *
FROM `default_videosz`
WHERE `status` =  1
 LIMIT 1
ERROR - 2015-03-23 23:37:44 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE `status` =  1
 LIMIT 1' at line 2 - Invalid query: SELECT COUNT(*) AS `numrows`
WHERE `status` =  1
 LIMIT 1
ERROR - 2015-03-23 23:41:43 --> Severity: Notice  --> Undefined variable: query D:\www-root\lbhpers\addons\default\modules\videos\controllers\videos.php 17
ERROR - 2015-03-23 23:44:55 --> Page Missing: videos/2
ERROR - 2015-03-23 23:46:01 --> Page Missing: videos/1
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Undefined variable: post D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 5
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Trying to get property of non-object D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 5
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Trying to get property of non-object D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 5
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Trying to get property of non-object D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 5
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Undefined variable: post D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 5
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Trying to get property of non-object D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 5
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Undefined variable: post D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 6
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Trying to get property of non-object D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 6
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Undefined variable: post D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 6
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Trying to get property of non-object D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 6
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Undefined variable: post D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 6
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Trying to get property of non-object D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 6
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Undefined variable: post D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 6
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Trying to get property of non-object D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 6
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Undefined variable: post D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 5
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Trying to get property of non-object D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 5
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Trying to get property of non-object D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 5
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Trying to get property of non-object D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 5
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Undefined variable: post D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 5
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Trying to get property of non-object D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 5
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Undefined variable: post D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 6
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Trying to get property of non-object D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 6
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Undefined variable: post D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 6
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Trying to get property of non-object D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 6
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Undefined variable: post D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 6
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Trying to get property of non-object D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 6
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Undefined variable: post D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 6
ERROR - 2015-03-23 23:54:28 --> Severity: Notice  --> Trying to get property of non-object D:\www-root\lbhpers\addons\default\modules\videos\views\index.php 6
