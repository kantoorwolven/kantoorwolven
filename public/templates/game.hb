<div class="{{nightOrDay}}">
    <div class="pure-g">
        <div class="pure-u-1-5"><img src="/img/{{playerType}}.png"/></div>
        <div class="pure-u-3-5"><h1>Game: "{{name}}"</h1></div>
        <div class="pure-u-1-5"><a href="#/pick_game"><img src="/img/terug.png"/></a></div>
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
                        <input type="hidden" value="{{../game_id}}" name="game_id"/>
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
        {{/with}}
        {{#unless gameStarted}}
            <div class="pure-g margin">
                <div class="pure-u-1-5"></div>  
                <div class="pure-u-3-5">
                Om {{starttime}} begint het spel!
                </div>
                <div class="pure-u-1-5"></div>
            </div>
        {{else}}
            <div class="pure-g margin">
                <div class="pure-u-1-5"></div>  
                <div class="pure-u-3-5">
                Nog {{deadline}} seconden tot 
                {{#if isNight}}
                    de dag aan breekt.
                {{else}}
                    de de zon ondergaat.
                {{/if}}
                </div>
                <div class="pure-u-1-5"></div>
            </div>
        {{/unless}}
        <div class="pure-g margin">
            <div class="pure-u-1-5"></div>  
            <div class="pure-u-3-5">
            Je bent een {{playerType}}.... shhhh.
            </div>
            <div class="pure-u-1-5"></div>
        </div>
    </div>
</div>