{extends file="base/index"}

{block name="head_title" prepend}{translate key="title.vocabularies"} - {translate key="title.taxonomy"} - {/block}

{block name="content_title"}
<div class="page-header">
    <h1>{translate key="title.taxonomy"} <small>{translate key="title.vocabularies"}</small></h1>
</div>
{/block}

{block name="content_body" append}
   {if $vocabularyUrl}
       <div class="btn-group spacer">
           <a class="btn btn--brand" href="{$vocabularyUrl}">{translate key="button.vocabulary.add"}</a>
       </div>
   {/if}

    {include file="base/table" table=$table tableForm=$form}
{/block}

{block name="scripts" append}
    <script src="{$app.url.base}/electric/js/form.js"></script>
    <script src="{$app.url.base}/electric/js/table.js"></script>
{/block}
