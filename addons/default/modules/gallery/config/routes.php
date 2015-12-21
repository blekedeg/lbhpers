<?php

$route['(gallery)/(:num)/(:num)/(:num)/(:any)']   = 'gallery/view/$5';
$route['(gallery)/page(/:num)?']           = 'news/index$2';
$route['(gallery)/rss/all.rss']            = 'rss/index';

// admin
$route['gallery/admin/categories(/:any)?'] = 'admin_categories$1';
$route['gallery/admin/fields(/:any)?']		= 'admin_fields$1';
