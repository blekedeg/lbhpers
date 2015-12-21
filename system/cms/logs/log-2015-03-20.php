<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); ?>

ERROR - 2015-03-20 00:49:07 --> Severity: Notice  --> Undefined property: stdClass::$image D:\www-root\lbhpers\addons\default\modules\videos\plugin.php 537
ERROR - 2015-03-20 00:49:07 --> Severity: Notice  --> Undefined property: stdClass::$image D:\www-root\lbhpers\addons\default\modules\videos\plugin.php 537
ERROR - 2015-03-20 00:49:20 --> Severity: Notice  --> Undefined property: stdClass::$image D:\www-root\lbhpers\addons\default\modules\videos\plugin.php 537
ERROR - 2015-03-20 00:49:20 --> Severity: Notice  --> Undefined property: stdClass::$image D:\www-root\lbhpers\addons\default\modules\videos\plugin.php 537
ERROR - 2015-03-20 00:56:31 --> Severity: Notice  --> Undefined property: stdClass::$image D:\www-root\lbhpers\addons\default\modules\videos\plugin.php 537
ERROR - 2015-03-20 00:56:31 --> Severity: Notice  --> Undefined property: stdClass::$image D:\www-root\lbhpers\addons\default\modules\videos\plugin.php 537
ERROR - 2015-03-20 00:59:45 --> Severity: Notice  --> Undefined property: stdClass::$image D:\www-root\lbhpers\addons\default\modules\videos\plugin.php 537
ERROR - 2015-03-20 00:59:45 --> Severity: Notice  --> Undefined property: stdClass::$image D:\www-root\lbhpers\addons\default\modules\videos\plugin.php 537
ERROR - 2015-03-20 00:59:48 --> Severity: Notice  --> Undefined property: stdClass::$image D:\www-root\lbhpers\addons\default\modules\videos\plugin.php 537
ERROR - 2015-03-20 00:59:48 --> Severity: Notice  --> Undefined property: stdClass::$image D:\www-root\lbhpers\addons\default\modules\videos\plugin.php 537
ERROR - 2015-03-20 01:10:10 --> Severity: Notice  --> Undefined property: stdClass::$file D:\www-root\lbhpers\addons\default\modules\videos\controllers\videos.php 32
ERROR - 2015-03-20 01:29:22 --> Query error: Unknown column 'ord' in 'order clause' - Invalid query: 
					SELECT
						vid.id,
						vid.title,
						vid.description,
						vid.video_id,
						vid.status,
						vid.created_on,
						vid.updated_on
					FROM default_videos vid
					
					WHERE UPPER(title) LIKE '%%'
				
					ORDER BY ord DESC
				
ERROR - 2015-03-20 01:30:16 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESCz' at line 18 - Invalid query: 
					SELECT
						vid.id,
						vid.title,
						vid.description,
						vid.video_id,
						vid.status,
						vid.created_on,
						vid.updated_on,
						usr1.username AS created_by,
						usr2.username AS updated_by,
						CASE WHEN vid.updated_on IS NOT NULL THEN vid.updated_on ELSE vid.created_on END AS ord
					FROM default_videos vid
					LEFT JOIN default_users usr1 ON usr1.id = vid.created_by
					LEFT JOIN default_users usr2 ON usr2.id = vid.updated_by
					
					WHERE UPPER(title) LIKE '%%'
				
					ORDER BY ord DESCz
				
ERROR - 2015-03-20 02:08:12 --> Severity: Notice  --> Undefined property: stdClass::$status D:\www-root\lbhpers\addons\default\modules\videos\views\admin\form.php 43
ERROR - 2015-03-20 02:13:54 --> Severity: Warning  --> file_get_contents(http://gdata.youtube.com/feeds/api/videos/hAGkd6MZzcc_?v=2&amp;alt=json): failed to open stream: HTTP request failed! HTTP/1.0 400 Bad Request
 D:\www-root\lbhpers\addons\default\modules\videos\plugin.php 545
ERROR - 2015-03-20 02:14:07 --> Severity: Warning  --> file_get_contents(http://gdata.youtube.com/feeds/api/videos/hAGkd6MZzcc_?v=2&amp;alt=json): failed to open stream: HTTP request failed! HTTP/1.0 400 Bad Request
 D:\www-root\lbhpers\addons\default\modules\videos\plugin.php 545
ERROR - 2015-03-20 02:16:34 --> Severity: Warning  --> file_get_contents(http://gdata.youtube.com/feeds/api/videos/hAGkd6MZzcc_?v=2&amp;alt=json): failed to open stream: HTTP request failed! HTTP/1.0 400 Bad Request
 D:\www-root\lbhpers\addons\default\modules\videos\plugin.php 545
ERROR - 2015-03-20 02:23:32 --> Severity: Warning  --> file_get_contents(http://gdata.youtube.com/feeds/api/videos/1EOzlF3Hhzw__?v=2&amp;alt=json): failed to open stream: HTTP request failed! HTTP/1.0 400 Bad Request
 D:\www-root\lbhpers\addons\default\modules\videos\plugin.php 545
ERROR - 2015-03-20 03:30:23 --> Page Missing: admin/videos/edit/31
ERROR - 2015-03-20 03:40:37 --> Page Missing: admin/videosz
ERROR - 2015-03-20 03:47:54 --> Severity: Notice  --> Undefined variable: view D:\www-root\lbhpers\addons\default\modules\videos\controllers\admin.php 266
ERROR - 2015-03-20 03:47:54 --> Severity: Notice  --> Undefined variable: page D:\www-root\lbhpers\addons\default\modules\videos\controllers\admin.php 266
ERROR - 2015-03-20 03:47:54 --> Severity: Notice  --> Undefined variable: template D:\www-root\lbhpers\addons\default\modules\videos\controllers\admin.php 266
ERROR - 2015-03-20 21:31:53 --> Page Missing: system/cms/themes/default/css/img/header.jpg
