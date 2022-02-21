<?php

$schema['promotions'] = array(
    'content' => array(
        'items' => array(
            'remove_indent' => true,
            'hide_label' => true,
            'type' => 'enum',
            'object' => 'promotions',
            'items_function' => 'fn_get_promotions',
            'fillings' => array(
                'manually' => array(
                    'picker' => 'addons/blocks_promotions/pickers/promotions/picker.tpl',
                    'picker_params' => array(
                        'type' => 'links',
                        'positions' => true,
                    ),
                    'params' => array(
                        'extend' => array(
                            'get_images' => true,
                        ),
                    ),
                ),
            ),
        ),
    ),
    'templates' => 'addons/blocks_promotions/blocks/promotions/promotions.tpl',
);

return $schema;
