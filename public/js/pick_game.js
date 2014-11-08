Sammy('#main', function() {
    this.get("#/pick_game", function () {
        var zis = this;
    
        $.getJSON("/games.json", function(games){
            zis.games = games;
            zis.partial('templates/pick_game.hb');
        });
    });
});