<?php

require_once('data.php');
require_once('helpers.php');
require_once('functions.php');

$is_auth = rand(0, 1);

$page_content = include_template('main.php', [
    'lots' => $lots,
    'categories' => $categories,
]);

$layout_content = include_template('layout.php', [
    'content' => $page_content,
    'categories' => $categories,
    'title' => 'YetiCave - Главная страница',
    'user_name' => $user_name,
    'is_auth' => $is_auth,
]);

print ($layout_content);
