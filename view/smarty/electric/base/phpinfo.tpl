{extends file="base/index"}

{block name="head_title" prepend}{translate key="title.phpinfo"} - {/block}

{block name="content_title"}
    <div class="page-header">
        <h1>{translate key="title.phpinfo"}</h1>
    </div>
{/block}

{block name="content" append}
    <div class="phpinfo">
        {str_replace("<table", "<table class=\"table table-bordered table-striped\"",$phpinfo)}
    </div>
{/block}
