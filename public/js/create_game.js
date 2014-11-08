 Sammy('#main', function () {
     var full = location.protocol+'//'+location.hostname;
    
     this.get('#/create_game', function () {
        var today = new Date();
        var day = new Date();
        day.setHours(16);
        day.setMinutes(30);
        day.setMilliseconds(0);

         
        this.starttime = [];
        if (today.getHours() <= 16 && today.getMinutes() <= 30) {
            this.starttime.push({ value: "vandaag om 16:30", id : day.getTime() });
        }
        day.setDate(day.getDate() + 1);
        this.starttime.push({ value: "morgen om 16:30", id : day.getTime() });
        day.setDate(day.getDate() + 2);
        this.starttime.push({ value: "overmorgen om 16:30", id : day.getTime() });
        
        this.partial('templates/create_game.hb');
    });
    
    this.post('#/create_game', function() {
        var zis = this;
        var game = {
            name: this.params.name,
            num_players: this.params.player_number,
            start_time: this.params.start_time
        };
        
        $.ajax({
            type: "POST",
            url: full + ":3000" + "/games.json",
            data: JSON.stringify(game),
            contentType: 'application/json',
            dataType: 'json'
        }).then(function(data) {
            localStorage.setItem("kantoorwolven.current.game", data.id);
            game = data;
            return $.ajax({
                type: "POST",
                url: full + ":3000" + "/games/" + data.id + "/players",
                contentType: "application/json",
                data: localStorage.getItem("kantoorwolven.player"),
                dataType: "json"
            });
        }).then(function(){
            zis.redirect('#/game/' + game.id);
        });
    });
 });