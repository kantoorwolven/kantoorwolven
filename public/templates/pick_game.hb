<div>
    <style scoped>
        .button-success,
        .button-error,
        .button-warning,
        .button-secondary {
            color: white;
            border-radius: 4px;
            text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
        }

        .button-success {
            background: rgb(28, 184, 65); /* this is a green */
        }

        .button-error {
            background: rgb(202, 60, 60); /* this is a maroon */
        }
    </style>
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
                {{#if canJoin}}
                <div class="pure-u-3-5"><a class="pure-button pure-u-1 addshadow" href="#/game/{{id}}">{{name}} {{players.length}}/{{max_players}}</a></div>
                {{else}}
                    {{#if haveJoined}}
                        <div class="pure-u-3-5"><a class="button-success pure-button pure-u-1 addshadow" href="#/game/{{id}}">{{name}} {{players.length}}/{{max_players}}</a></div>
                    {{/if}}
                {{/if}}
                <div class="pure-u-1-5"></div>
            </div>
        {{/each}}
        <div class="pure-g margin">
            <div class="pure-u-1-5"></div>
            <div class="pure-u-3-5"><a class="pure-button pure-button-primary pure-u-1 addshadow" href="#/create_game">Create a game!</a></div>
            <div class="pure-u-1-5"></div>
        </div>
    </div>
</div>