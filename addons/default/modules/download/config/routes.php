<?php

$route['(download)/(:num)/(:num)/(:num)/(:any)']   = 'download/view/$5';
$route['(download)/page(/:num)?']           = 'download/index$2';
$route['(download)/rss/all.rss']            = 'rss/index';

// admin
$route['download/admin/fields(/:any)?']		= 'admin_fields$1';
