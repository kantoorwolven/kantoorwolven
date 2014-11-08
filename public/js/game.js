Sammy('#main', function() {    
    this.get("#/game/:id", function() {
        var zis = this;
        var player = JSON.parse(localStorage.getItem("kantoorwolven.player"));
        var draw = function (data) {
            zis.name = data.name;
            zis.players = data.players;
            zis.currentRound = data.rounds.sort(function(l, r) {
                return r.id - l.id;                
            })[0];
            
            zis.currentRound.canVote = true;
            zis.currentRound.votees = [
                { name: "Piet", votes: 10 }
            ];
            
            zis.currentRound.deadline = new Date().toTimeString();
            zis.nightOrDay = 'night';
            zis.partial('templates/game.hb');
        };
        $.getJSON("/games/" + this.params.id + ".json").then(function(data) {
            var joined = data.players.some(function(p) { return p.email == player.email; });
            if (!joined) {
                $.ajax({
                    url: "/games/" + zis.params.id + "/players",
                    type: "POST",
                    data: JSON.stringify(player),
                    dataType: 'json',
                    contentType: 'application/json'
                }).then(function() { 
                    return data.players.push(player); 
                }, function() {
                    zis.message = "Cannot join game";
                    return;
                }).then(function(){
                    draw(data);
                });
            } else {
                draw(data);
            }
        });
        

    });
});