<?php

use Tygh\Registry;

if (!defined('BOOTSTRAP')) {
    die('Access denied');
}

function fn_blocks_promotions_get_promotions(&$params, $fields, $sortings, &$condition, $join, $group, $lang_code)
{
    if (!empty($params['item_ids'])) {
        $condition .= db_quote(' AND ?:promotions.promotion_id IN (?n)', explode(',', $params['item_ids']));
    }
}
