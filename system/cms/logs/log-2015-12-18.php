<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); ?>

ERROR - 2015-12-18 11:10:27 --> Query error: Table 'db_press.default_downloadz' doesn't exist - Invalid query: SELECT `default_download`.*
FROM `default_downloadz`
WHERE `status` =  1
AND `status` =  1
ORDER BY `created_on` DESC
 LIMIT 1
ERROR - 2015-12-18 11:17:56 --> Severity: Warning  --> strtolower() expects exactly 1 parameter, 2 given D:\htdocs\lbhpers\addons\default\modules\download\plugin.php 545
ERROR - 2015-12-18 11:18:33 --> Severity: Warning  --> strtolower() expects exactly 1 parameter, 2 given D:\htdocs\lbhpers\addons\default\modules\download\plugin.php 545
ERROR - 2015-12-18 11:29:35 --> Will go ahead and create the following tables: slideshow
ERROR - 2015-12-18 11:29:35 --> -- Creating table: slideshow
ERROR - 2015-12-18 11:29:35 --> All done perfectly!
ERROR - 2015-12-18 11:39:39 --> Query error: Unknown column 'slideshow.cover' in 'field list' - Invalid query: 
					SELECT
						slideshow.id,
						slideshow.title,
						slideshow.status,
						slideshow.cover,
						slideshow.file,
						slideshow.created_on,
						slideshow.updated_on,
						usr1.username AS created_by,
						usr2.username AS updated_by,
						CASE WHEN slideshow.updated_on IS NOT NULL THEN slideshow.updated_on ELSE slideshow.created_on END AS ord
					FROM default_slideshow slideshow
					LEFT JOIN default_users usr1 ON usr1.id = slideshow.created_by
					LEFT JOIN default_users usr2 ON usr2.id = slideshow.updated_by
					
					WHERE UPPER(title) LIKE '%%'
				
					ORDER BY ord DESC
				
ERROR - 2015-12-18 11:39:57 --> Query error: Unknown column 'slideshow.cover' in 'field list' - Invalid query: 
					SELECT
						slideshow.id,
						slideshow.title,
						slideshow.status,
						slideshow.cover,
						slideshow.file,
						slideshow.created_on,
						slideshow.updated_on,
						usr1.username AS created_by,
						usr2.username AS updated_by,
						CASE WHEN slideshow.updated_on IS NOT NULL THEN slideshow.updated_on ELSE slideshow.created_on END AS ord
					FROM default_slideshow slideshow
					LEFT JOIN default_users usr1 ON usr1.id = slideshow.created_by
					LEFT JOIN default_users usr2 ON usr2.id = slideshow.updated_by
					
					WHERE UPPER(title) LIKE '%%'
				
					ORDER BY ord DESC
				
ERROR - 2015-12-18 11:43:48 --> Severity: Notice  --> Undefined property: stdClass::$description D:\htdocs\lbhpers\addons\default\modules\slideshow\views\admin\form.php 22
ERROR - 2015-12-18 11:48:18 --> Severity: Notice  --> Undefined index: cover D:\htdocs\lbhpers\addons\default\modules\slideshow\controllers\admin.php 151
ERROR - 2015-12-18 11:48:18 --> Severity: Notice  --> Undefined index: cover D:\htdocs\lbhpers\addons\default\modules\slideshow\controllers\admin.php 151
ERROR - 2015-12-18 11:48:53 --> Severity: Notice  --> Undefined index: cover D:\htdocs\lbhpers\addons\default\modules\slideshow\controllers\admin.php 151
ERROR - 2015-12-18 11:48:53 --> Severity: Notice  --> Undefined index: cover D:\htdocs\lbhpers\addons\default\modules\slideshow\controllers\admin.php 151
ERROR - 2015-12-18 11:49:53 --> Severity: Notice  --> Undefined variable: image D:\htdocs\lbhpers\addons\default\modules\slideshow\controllers\admin.php 159
ERROR - 2015-12-18 11:50:43 --> Page Missing: undefined
ERROR - 2015-12-18 13:06:21 --> Page Missing: undefined
ERROR - 2015-12-18 13:12:15 --> Severity: Notice  --> Undefined property: stdClass::$cover D:\htdocs\lbhpers\addons\default\modules\slideshow\views\admin\form.php 29
ERROR - 2015-12-18 13:12:52 --> Page Missing: test-ajah-dulu_img_20151218_130917.jpg
ERROR - 2015-12-18 13:18:11 --> Severity: Notice  --> Undefined property: stdClass::$cover D:\htdocs\lbhpers\addons\default\modules\slideshow\controllers\admin.php 321
ERROR - 2015-12-18 13:18:11 --> Severity: Warning  --> unlink(data/default/slideshow/): Permission denied D:\htdocs\lbhpers\addons\default\modules\slideshow\controllers\admin.php 321
ERROR - 2015-12-18 13:29:51 --> Page Missing: system/cms/themes/lbhpers/test-ajah-dulu_img_20151218_131811.jpg
ERROR - 2015-12-18 13:29:51 --> Page Missing: system/cms/themes/lbhpers/lorem-ipsum-dolor-sit-amet_img_20151218_114817.jpg
ERROR - 2015-12-18 13:29:53 --> Page Missing: system/cms/themes/lbhpers/test-ajah-dulu_img_20151218_131811.jpg
ERROR - 2015-12-18 13:29:53 --> Page Missing: system/cms/themes/lbhpers/lorem-ipsum-dolor-sit-amet_img_20151218_114817.jpg
ERROR - 2015-12-18 13:34:01 --> Page Missing: system/cms/themes/lbhpers/test-ajah-dulu_img_20151218_131811.jpg
ERROR - 2015-12-18 13:34:01 --> Page Missing: system/cms/themes/lbhpers/lorem-ipsum-dolor-sit-amet_img_20151218_114817.jpg
ERROR - 2015-12-18 13:34:02 --> Page Missing: system/cms/themes/lbhpers/test-ajah-dulu_img_20151218_131811.jpg
ERROR - 2015-12-18 13:34:03 --> Page Missing: system/cms/themes/lbhpers/lorem-ipsum-dolor-sit-amet_img_20151218_114817.jpg
ERROR - 2015-12-18 13:34:09 --> Page Missing: system/cms/themes/lbhpers/test-ajah-dulu_img_20151218_131811.jpg
ERROR - 2015-12-18 13:34:10 --> Page Missing: system/cms/themes/lbhpers/lorem-ipsum-dolor-sit-amet_img_20151218_114817.jpg
ERROR - 2015-12-18 13:34:13 --> Page Missing: system/cms/themes/lbhpers/lorem-ipsum-dolor-sit-amet_img_20151218_114817.jpg
ERROR - 2015-12-18 13:34:13 --> Page Missing: system/cms/themes/lbhpers/test-ajah-dulu_img_20151218_131811.jpg
