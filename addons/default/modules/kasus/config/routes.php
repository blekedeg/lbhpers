<?php

$route['(kasus)/(:num)/(:num)/(:num)/(:num)/(:any)']   = 'kasus/view/$2';
$route['(kasus)/page(/:num)?']           = 'kasus/index$2';
$route['(kasus)/rss/all.rss']            = 'rss/index';

// admin
$route['kasus/admin/categories(/:any)?'] = 'admin_categories$1';
$route['kasus/admin/fields(/:any)?']		= 'admin_fields$1';