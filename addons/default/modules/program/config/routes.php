<?php

$route['(program)/(:num)/(:num)/(:num)/(:num)/(:any)']   = 'program/view/$2';
$route['(program)/page(/:num)?']           = 'program/index$2';
$route['(program)/rss/all.rss']            = 'rss/index';

// admin
$route['program/admin/categories(/:any)?'] = 'admin_categories$1';
$route['program/admin/fields(/:any)?']		= 'admin_fields$1';