Sammy('#main', function() {
    this.get("#/pick_game", function () {
        var zis = this;
        var curPlayer = JSON.parse(localStorage.getItem("kantoorwolven.player"));
    
        $.getJSON("/games.json", function(games){
            zis.games = games.map(function(g) {
                g.canJoin = g.players.length < g.max_players && Date.parse(g.starttime) > new Date().getTime();
                g.haveJoined = g.players.some(function(p) {
                    return curPlayer.email == p.email;
                });
                return g;
            });
            zis.partial('templates/pick_game.hb');
        });
    });
});