<?php

$route['(slideshow)/(:num)/(:num)/(:num)/(:any)']   = 'slideshow/view/$5';
$route['(slideshow)/page(/:num)?']           = 'slideshow/index$2';
$route['(slideshow)/rss/all.rss']            = 'rss/index';

// admin
$route['slideshow/admin/fields(/:any)?']		= 'admin_fields$1';
