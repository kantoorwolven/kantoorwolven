Sammy('#main', function() {    
    this.get("#/game/:id", function() {
        var zis = this;
        var player = JSON.parse(localStorage.getItem("kantoorwolven.player"));
        var draw = function (data) {
            zis.name = data.name;
            zis.players = data.players;
            
            zis.player_id = zis.players.filter(function(p) {
                return p.email == player.email;
            })[0].id;
            
            zis.currentRound = data.rounds.filter(function(r) {
                return r.active;   
            })[0];
            
            $.getJSON("/rounds/" + zis.currentRound.id).then(function (data) {
                zis.currentRound.type = data.type;
                zis.isNight = data.type == "Night";
                return;
            }).then(function() {         
                return $.getJSON("/player?email=" + player.email);
            }).then(function(data){ 
                zis.playerType = data.type == "Villager" ? "dorpeling" : "weerwolf";
                zis.canVote = (data.type == "Werewolf" && zis.currentRound.type == "Night") || zis.currentRound.type == "Day";
                return;
            }).then(function() {          
                if (zis.canVote) {
                    if (zis.isNight) {
                        
                    } else {
                        zis.currentRound.votees = zis.currentRound.players.map(function(p) {
                            return {
                                name: p.name,
                                votes: Math.random(),
                                id: p.id
                            };
                        });
                    }
                }
                
                zis.deadline = parseInt((Date.parse(zis.currentRound.deadline) - new Date().getTime()) / 1000);
                zis.nightOrDay = zis.currentRound.type.toLowerCase();

                zis.partial('templates/game.hb');
            });
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