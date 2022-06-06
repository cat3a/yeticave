<?php

$user_name = 'Александра'; // укажите здесь ваше имя

$categories = [
    'boards' => 'Доски и лыжи',
    'attachment' => 'Крепления',
    'boots' => 'Ботинки',
    'clothing' => 'Одежда',
    'tools' => 'Инструменты',
    'other' => 'Разное'
];

$lots = [
    [
        'name' => '2014 Rossignol District Snowboard',
        'category' => $categories['boards'],
        'price' => 10999,
        'image' => 'img/lot-1.jpg',
        'date' => '2022-07-05'
    ],
    [
        'name' => 'DC Ply Mens 2016/2017 Snowboard',
        'category' => $categories['boards'],
        'price' => 159999,
        'image' => 'img/lot-2.jpg',
        'date' => '2022-06-02'
    ],
    [
        'name' => 'Крепления Union Contact Pro 2015 года размер L/XL',
        'category' => $categories['attachment'],
        'price' => 8000,
        'image' => 'img/lot-3.jpg',
        'date' => '2022-08-10'
    ],
    [
        'name' => 'Ботинки для сноуборда DC Mutiny Charocal',
        'category' => $categories['boots'],
        'price' => 10999,
        'image' => 'img/lot-4.jpg',
        'date' => '2022-06-21'
    ],
    [
        'name' => 'Куртка для сноуборда DC Mutiny Charocal',
        'category' => $categories['clothing'],
        'price' => 7500,
        'image' => 'img/lot-5.jpg',
        'date' => '2022-07-15'
    ],
    [
        'name' => 'Маска Oakley Canopy',
        'category' => $categories['other'],
        'price' => 5400,
        'image' => 'img/lot-6.jpg',
        'date' => '2022-07-25'
    ]
];

