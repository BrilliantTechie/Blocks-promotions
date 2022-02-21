{if $promotion_id == "0"}
    {assign var="promotion" value=$default_name}
{else}
    {assign var="promotion" value=$promotion_id|fn_get_promotion_name|default:"`$ldelim`promotion`$rdelim`"}
{/if}

<tr {if !$clone}id="{$holder}_{$promotion_id}" {/if}class="cm-js-item{if $clone} cm-clone hidden{/if}">
    {if $position_field}
        <td data-th="{__("position_short")}">
            <input type="text" name="{$input_name}[{$promotion_id}]" value="{math equation="a*b" a=$position b=10}" size="3" class="input-micro" {if $clone}disabled="disabled"{/if} />
        </td>
    {/if}
    <td data-th="{__("name")}"><a href="{"promotions.update?promotion_id=`$promotion_id`"|fn_url}">{$promotion}</a></td>
    <td data-th="&nbsp;">
        {capture name="tools_list"}
            {if !$hide_delete_button && !$view_only}
                <li><a onclick="Tygh.$.cePicker('delete_js_item', '{$holder}', '{$promotion_id}', 'b'); return false;">{__("delete")}</a></li>
            {/if}
        {/capture}
        <div class="hidden-tools">
            {dropdown content=$smarty.capture.tools_list}
        </div>
    </td>
</tr>