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
            <div class="pure-u-1-5"></div>
            <div class="pure-u-3-5"></div>
            <div class="pure-u-1-5"></div>
        </div>
        {{#each games}}
            {{#if canJoin}}
            <div class="pure-g margin">
                <div class="pure-u-1-5"></div>
                <div class="pure-u-3-5">
                    <a href="#/game/{{id}}">
                        <button class="pure-button addshadow pure-u-1">{{name}} {{players.length}}/{{max_players}}</button>
                    </a>
                </div>
                <div class="pure-u-1-5"></div>
            </div>
            {{else}}
                {{#if haveJoined}}
                <div class="pure-g margin">
                    <div class="pure-u-1-5"></div>
                    <div class="pure-u-3-5">
                        <a href="#/game/{{id}}">
                            <button class="button-success pure-button addshadow pure-u-1">{{name}} {{players.length}}/{{max_players}}</button>
                        </a>
                    </div>
                    <div class="pure-u-1-5"></div>
                </div>
                {{/if}}
            {{/if}}
        {{/each}}
        <div class="pure-g margin">
            <div class="pure-u-1-5"></div>
            <div class="pure-u-3-5">
                <a href="#/create_game"><button class="pure-button pure-button-primary addshadow pure-u-1">Create a game!</button></a>
            </div>
            <div class="pure-u-1-5"></div>
        </div>
    </div>
</div>