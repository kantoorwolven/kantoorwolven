<div class="{{nightOrDay}}">
    <div class="pure-g">
        <div class="pure-u-1-5"></div>
        <div class="pure-u-3-5"><h1>Game: "{{name}}"</h1></div>
        <div class="pure-u-1-5"></div>
    </div>
    <div class="pure-g margin">
        {{#if message}}
            <div class="pure-u-1-5"></div>
            <div class="pure-button-error">{{message}}</div>
            <div class="pure-u-1-5"></div>
        {{/if}}
    </div>
    <div class="pure-g first"></div>      
        {{#with currentRound}}
            {{#if ../canVote}}
                {{#each votees}}
                <div class="pure-g margin">
                    <div class="pure-u-1-5"></div>  
                    <div class="pure-u-3-5">
                    <form action="#/vote" method="post">
                        <input type="hidden" value="{{game_id}}" name="game_id"/>
                        <input type="hidden" value="{{../id}}" name="round_id"/>
                        <input type="hidden" value="{{../../../player_id}}" name="player_id"/>
                        <input type="hidden" value="{{id}}" name="voted_id"/>
                        <input type="submit" value="{{name}} {{votes}}" class="pure-button pure-u-1"/>
                    </form>
                    <div class="pure-u-1-5"></div>
                    </div>
                </div>    
                {{/each}}
            {{/if}}
            <div class="pure-u-1-5"></div>  
            <div class="pure-u-3-5">
            Nog {{deadline}} seconden..
            </div>
            <div class="pure-u-1-5"></div>
        {{/with}}
    </div>
</div>