Spel!
    
{{#if message}}
    <div class="button-error">{{message}}</div>
{{/if}}

{{name}}

Players:
<ul>
{{#each players}}
    <li>{{name}}</li>
{{/each}}
</ul>