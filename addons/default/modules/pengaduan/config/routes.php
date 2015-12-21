<?php

$route['(program)/(:num)/(:num)/(:num)/(:any)']   = 'program/view/$5';
$route['(program)/page(/:num)?']           = 'news/index$2';
$route['(program)/rss/all.rss']            = 'rss/index';