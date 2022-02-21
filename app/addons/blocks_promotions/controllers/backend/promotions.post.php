<?php

use Tygh\Registry;

if (!defined('BOOTSTRAP')) {
    die('Access denied');
}

if ($mode == 'picker') {

    list($promotions, $params) = fn_get_promotions($_REQUEST, Registry::get('settings.Appearance.admin_elements_per_page'), DESCR_SL);
    Tygh::$app['view']->assign('promotions', $promotions);
    Tygh::$app['view']->assign('search', $params);

    Tygh::$app['view']->display('addons/blocks_promotions/pickers/promotions/picker_contents.tpl');

    exit;
}
