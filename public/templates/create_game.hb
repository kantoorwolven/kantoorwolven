<div class="twilight">
    <div class="pure-g">
        <div class="pure-u-1-5"></div>
        <div class="pure-u-3-5">
            <h1>Start een spel</h1>
        </div>
        <div class="pure-u-1-5"></div>
    </div>

    <form class="pure-form pure-form-aligned" method="post" action="#/create_game">
        <fieldset>
            <div class="pure-g first">
                <div class="pure-u-1-5"></div>
                <div class="pure-u-3-5">
                        <label for="name">Naam</label>
                        <input id="name" type="text" placeholder="Naam" name="name">
                    
                </div>
                <div class="pure-u-1-5"></div>
            </div>
            
            <div class="pure-g margin">
                <div class="pure-u-1-5"></div>
                <div class="pure-u-3-5">
                    <label for="player_number">Aantal spelers</label>
                    <input id="player_number" type="number" placeholder="Aantal spelers" name="player_number">
                </div>
                <div class="pure-u-1-5"></div>
            </div>
            
            <div class="pure-g margin">
                <div class="pure-u-1-5"></div>
                <div class="pure-u-3-5">
                    <label for="start_time">Start time</label>
                    <select id="start_time" name="start_time"> 
                    {{#each starttime}}
                        <option value="{{id}}">{{value}}</option>
                    {{/each}}
                    </select>
                </div>
                <div class="pure-u-1-5"></div>
            </div>

            <div class="pure-g margin">
                <div class="pure-u-1-5"></div>
                <div class="pure-u-3-5">
                    <button type="submit" id="create_game" class="pure-button pure-button-primary pure-u-1">Speel</button>
                </div>
                <div class="pure-u-1-5"></div>
            </div>
        </fieldset>
    </form>
</div>