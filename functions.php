<?php

use JetBrains\PhpStorm\ArrayShape;

/**
 * Форматирует цену
 * @param number $price - начальная цена
 * @return string - отформатированная цена
 */

function format_price($price): string
{
    $price = ceil($price);
    $price = number_format($price, 0, '', ' ');
    return $price . '&nbsp;&#8381;';
}

/**
 * Подсчитывает оставшееся время до конца выставления лота
 * @param number $lot_expiration - дата истечения лота в формате ДД-ЧЧ-ММ
 * @return array - ставшееся время до конца выставления лота в формате [ЧЧ, ММ]
 */

#[ArrayShape(['hours' => "string", 'minutes' => "string"])] function calculates_time($lot_expiration): array
{
    date_default_timezone_set('Europe/Ulyanovsk');
    $date_expiration_unix = strtotime($lot_expiration);
    $date_now_unix = strtotime(date('Y-m-d H:i'));
    $time_left = ($date_expiration_unix - $date_now_unix) / 60;
    $hours_left = floor($time_left / 60);
    $minutes_left = $time_left - $hours_left * 60;
    $minutes_left_format = str_pad($minutes_left, 2, "0", STR_PAD_LEFT);
    $hours_left_format = str_pad($hours_left, 2, "0", STR_PAD_LEFT);

    return [
        'hours' => $hours_left_format,
        'minutes' => $minutes_left_format
    ];
}
