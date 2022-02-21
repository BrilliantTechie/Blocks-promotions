
{include file="common/pagination.tpl" div_id="pagination_`$smarty.request.data_id`"}

{assign var="c_url" value=$config.current_url|fn_query_remove:"sort_by":"sort_order"}
{assign var="rev" value="pagination_`$smarty.request.data_id`"|default:"pagination_contents"}

{include_ext file="common/icon.tpl" class="icon-`$search.sort_order_rev`" assign=c_icon}
{include_ext file="common/icon.tpl" class="icon-dummy" assign=c_dummy}
{if $promotions}
<input type="hidden" id="add_promotion_id" name="promotion_id" value=""/>

<div class="table-responsive-wrapper">
    <table width="100%" class="table table-middle table--relative table-responsive">
    <thead>
    <tr>
        <th class="center" width="1%">
            {include file="common/check_items.tpl"}
        </th>
        <th width="70%"><a class="cm-ajax" href="{"`$c_url`&sort_by=name&sort_order=`$search.sort_order_rev`"|fn_url}" data-ca-target-id={$rev}>{__("banner")}{if $search.sort_by === "name"}{$c_icon nofilter}{else}{$c_dummy nofilter}{/if}</a></th>
        <th width="20%"><a class="cm-ajax" href="{"`$c_url`&sort_by=timestamp&sort_order=`$search.sort_order_rev`"|fn_url}" data-ca-target-id={$rev}>{__("creation_date")}{if $search.sort_by === "timestamp"}{$c_icon nofilter}{else}{$c_dummy nofilter}{/if}</a></th>
    </tr>
    </thead>
    {foreach from=$promotions item=promotion}
    <tr>
        <td>
            <input type="checkbox" name="{$smarty.request.checkbox_name|default:"promotions_ids"}[]" value="{$promotion.promotion_id}" class="cm-item mrg-check" /></td>
        <td id="promotion_{$promotion.promotion_id}" width="80%" data-th="{__("name")}">{$promotion.name}</td>
        <td width="20%" data-th="{__("to_date")}">
            {$promotion.to_date|date_format:"`$settings.Appearance.date_format`, `$settings.Appearance.time_format`"}
        </td>
    </tr>
    {/foreach}
    </table>
</div>

{else}
    <p class="no-items">{__("no_data")}</p>
{/if}

{include file="common/pagination.tpl" div_id="pagination_`$smarty.request.data_id`"}
