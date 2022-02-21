{if !$smarty.request.extra}
<script>
(function(_, $) {
    _.tr('text_items_added', '{__("text_items_added")|escape:"javascript"}');

    $.ceEvent('on', 'ce.formpost_promotions_form', function(frm, elm) {

        var promotions = {};

        if ($('input.cm-item:checked', frm).length > 0) {
            $('input.cm-item:checked', frm).each( function() {
                var id = $(this).val();
                promotions[id] = $('#promotion_' + id).text();
            });

            {literal}
            $.cePicker('add_js_item', frm.data('caResultId'), promotions, 'b', {
                '{promotion_id}': '%id'
            });
            {/literal}

            $.ceNotification('show', {
                type: 'N',
                title: _.tr('notice'),
                message: _.tr('text_items_added'),
                message_state: 'I'
            });
        }

        return false;
    });

}(Tygh, Tygh.$));
</script>
{/if}
</head>

<form action="{$smarty.request.extra|fn_url}" data-ca-result-id="{$smarty.request.data_id}" method="post" name="promotions_form" enctype="multipart/form-data">

{include file="addons/blocks_promotions/views/blocks_promotions/components/promotions_list.tpl" promotions=$promotions form_name="promotions_form"}

{if $promotions}
<div class="buttons-container">
    {include file="buttons/add_close.tpl" but_text=__("add_promotions") but_close_text=__("add_promotions_and_close") is_js=$smarty.request.extra|fn_is_empty}
</div>
{/if}

</form>
