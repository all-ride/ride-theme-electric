{extends file="base/index"}

{block name="content"}
    <div class="grid">
        <div class="grid__12 grid--bp-med__3">
            {block name="sidebar"}{/block}
        </div>
        <div class="grid__12 grid--bp-med__9">
            {block name="content_title"}{/block}
            {block name="messages"}
                {if isset($app.messages)}
                    {$_messageTypes = ["error" => "danger", "warning" => "warning", "success" => "success", "info" => "info"]}
                    {foreach $_messageTypes as $_messageType => $_messageClass}
                        {$_messages = $app.messages->getByType($_messageType)}
                        {if $_messages}
                            <div class="notice notice--{$_messageClass}" role="alert">
                                <button type="button" class="btn btn--close" data-dismiss="alert">
                                    <span aria-hidden="true">×</span><span class="visuallyhidden">Close</span>
                                </button>
                                {if count($_messages) == 1}
                                    {$_message = array_pop($_messages)}
                                    <p>{$_message->getMessage()}</p>
                                {else}
                                    <ul>
                                    {foreach $_messages as $_message}
                                        <li>{$_message->getMessage()}</li>
                                    {/foreach}
                                    </ul>
                                {/if}
                            </div>
                        {/if}
                    {/foreach}
                {/if}
            {/block}
            {block name="content_body"}{/block}
        </div>
    </div>
{/block}
