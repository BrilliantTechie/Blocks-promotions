<div class="grid-list ty-grid-promotions">
    {if $items}
        {foreach $items as $promotion}
            <div class="ty-column3">
                <div class="ty-grid-list__item ty-grid-promotions__item">
                    {if $promotion.image}
                        {include file="common/image.tpl"
                            images=$promotion.image
                            image_id="promotion_image"
                            class="ty-grid-promotions__image"
                        }
                    {/if}
                </div>
                <div class="ty-grid-promotions__content">
                    {if $promotion.to_date}
                        <div class="ty-grid-list__available">
                            {__("avail_till")}: {$promotion.to_date|date_format:$settings.Appearance.date_format}
                        </div>
                    {/if}
                    <h2 class="ty-grid-promotions__header">{$promotion.name}</h2>
                </div>
            </div>
        {/foreach}
</div>
    {else}
        <p>{__("text_no_active_promotions")}</p>
    {/if}
    
{capture name="mainbox_title"}{__("active_promotions")}{/capture}