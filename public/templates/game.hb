<div class="{{nightOrDay}}">

{{name}}

{{#if message}}
    <div class="button-error">{{message}}</div>
{{/if}}

{{#with currentRound}}
    {{#if canVote}}
        {{#each votees}}
        <form action="#/vote">
            <input type="button" value="{{name}} {{votes}}" class="pure-button"/>
        </form>
        {{/each}}
    {{/if}}
    {{deadline}}
{{/with}}

</div>