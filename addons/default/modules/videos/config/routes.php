<?php

$route['(videos)/(:num)/(:num)/(:num)/(:any)']   = 'videos/view/$5';
$route['(videos)/page(/:num)?']           = 'videos/index$2';
$route['(videos)/rss/all.rss']            = 'rss/index';