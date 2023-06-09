{extends file="base/index"}

{block name="head_title" prepend}{translate key="title.assets"} - {/block}

{block name="taskbar"}{if !$embed}{$smarty.block.parent}{/if}{/block}

{block name="content_title" append}
    <div class="page-header">
        <h1>{translate key="title.assets"} <small>{translate key="button.move"}</small></h1>
    </div>
{/block}

{block name="content_body" append}
    {include file="base/form.prototype"}

    <form id="{$form->getId()}" class="form" action="{$app.url.request}" method="POST" role="form">
        <div class="form__group">
            {call formRows form=$form}

            <div class="form__actions">
                <button type="submit" class="btn btn--default">{translate key="button.move"}</button>
                {if $referer}
                    <a href="{$referer}" class="btn btn--link">{translate key="button.cancel"}</a>
                {/if}
            </div>
        </div>
    </form>

    <hr  />

    <div class="gridOverview grid grid--2-col grid--bp-xsm-4-col grid--bp-sml-8-col asset-items-assets" data-order="true">
        {if $folders}
            {foreach $folders as $item}
                <div class="grid__item order-item" data-type="{$item->getType()}" data-id="{$item->getId()}">
                    <div class="preview preview--folder">
                        <div class="preview__image-container">
                            <div class="preview__image">
                                <img src="{$app.url.base}/electric/img/folder.svg" width="160" height="125" class="image image--full-width" />
                            </div>
                        </div>
                        <div class="preview__name-container">
                            <span class="preview__name">{$item->getName()}</span>
                        </div>
                    </div>
                </div>
            {/foreach}
        {/if}
        {if $assets}
            {foreach $assets as $item}
                <div class="grid__item" data-type="{$item->getType()}" data-id="{$item->getId()}">
                    <div class="preview preview--asset">
                        <div class="preview__image-container">
                            <div class="preview__image">
                                {if $item->getThumbnail()}
                                    <img src="{image src=$item->getThumbnail() width=160 height=125 transformation='crop'}" alt="" class="image image--full-width" title="{$item->getName()}"/>
                                {else}
                                    {$imgSource = "electric/img/preview/`$item->getType()`.png"}
                                    <img src="{image src=$imgSource}" alt="" class="image" title="{$item->getName()}"/>
                                {/if}
                            </div>
                        </div>
                        <div class="preview__name-container">
                            <span class="preview__name">{$item->getName()}</span>
                        </div>
                    </div>
                </div>
            {/foreach}
        {/if}
    </div>
{/block}
