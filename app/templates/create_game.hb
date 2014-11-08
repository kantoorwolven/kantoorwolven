<form class="pure-form pure-form-aligned" method="post" action="#/create_game">
    <fieldset>
        <div class="pure-control-group">
            <label for="name">Naam</label>
            <input id="name" type="text" placeholder="Naam" name="name">
        </div>

        <div class="pure-control-group">
            <label for="player_number">Aantal spelers</label>
            <input id="player_number" type="number" placeholder="Aantal spelers" name="player_number">
        </div>
        
        <div class="pure-control-group">   
            <label for="start_time">Start time</label>
            <select id="start_time" name="start_time"> 
            {{#each starttime}}
                <option value="{{id}}">{{value}}</option>
            {{/each}}
            </select>
        </div>

        <div class="pure-controls">
            <button type="submit" id="create_game" class="pure-button pure-button-primary">Speel!</button>
        </div>
    </fieldset>
</form>