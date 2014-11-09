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
            
            if (!zis.currentRound) {
                zis.gameStarted = false;
                zis.currentRound = {
                    type: 'twilight',
                    canVote: false
                };
                this.partial('templates/game.hb');
            } else {
                zis.gameStarted = true;
                $.getJSON("/rounds/" + zis.currentRound.id).then(function (data) {
                    zis.currentRound.type = data.type;
                    zis.isNight = data.type == "Night";
                    return;
                }).then(function() {         
                    return $.getJSON("/games/" + zis.currentRound.game_id  + "/player?email=" + player.email);
                }).then(function(data){ 
                    zis.playerType = data.type == "Villager" ? "dorpeling" : "weerwolf";
                    zis.canVote = (data.type == "Werewolf" && zis.currentRound.type == "Night") || zis.currentRound.type == "Day";
                    return;
                }).then(function() {
                    return $.getJSON("/games/" + zis.currentRound.game_id + "/rounds/" + zis.currentRound.id + "/votings");
                }).then(function(votes) {
                    zis.votes = votes;
                    return zis.isNight ? $.getJSON("/games/" + zis.currentRound.game_id + "/villagers") : [];
                }).then(function(villagers) {          
                    if (zis.canVote) {
                        if (zis.isNight) {
                            zis.currentRound.votees = villagers.map(function (v){
                                return {
                                    name: v.name,
                                    votes: zis.votes.filter(function(vote) { return vote.voted_id == v.id; }).length,
                                    id: v.id
                                };
                            });
                        } else {
                            zis.currentRound.votees = zis.currentRound.players.map(function(p) {
                                return {
                                    name: p.name,
                                    votes: zis.votes.filter(function(vote) { return vote.voted_id == p.id; }).length,
                                    id: p.id
                                };
                            });
                        }
                    }

                    zis.deadline = parseInt((Date.parse(zis.currentRound.deadline) - new Date().getTime()) / 1000);
                    zis.nightOrDay = zis.currentRound.type.toLowerCase();

                    zis.partial('templates/game.hb');
                });
            }
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
                }).then(function(newPlayer) { 
                    return data.players.push(newPlayer); 
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