<div class="twilight">
    <div class="pure-g">
        <div class="pure-u-1-5"></div>
        <div class="pure-u-3-5"><h1>Kies een spel</h1></div>
        <div class="pure-u-1-5"></div>
    </div>
    <div class="pure-g first">
        <div class="pure-u-1-1"></div>
    </div>
    {{#each games}}
        <div class="pure-g margin">
            <div class="pure-u-1-5"></div>
            <div class="pure-u-3-5"><a class="pure-button pure-u-1" href="#/game/{{id}}">{{name}} {{players.length}}/{{max_players}}</a></div>
            <div class="pure-u-1-5"></div>
        </div>
    {{/each}}
    <div class="pure-g margin">
        <div class="pure-u-1-5"></div>
        <div class="pure-u-3-5"><a class="pure-button pure-button-primary pure-u-1" href="#/create_game">Create a game!</a></div>
        <div class="pure-u-1-5"></div>
    </div>
</div>