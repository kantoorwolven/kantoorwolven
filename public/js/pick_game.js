Sammy('#main', function() {
    var full = location.protocol+'//'+location.hostname;
    
    this.get("#/pick_game", function () {
        var zis = this;
    
        $.getJSON(full + ":3000" + "/games.json", function(games){
            zis.games = games;
            zis.partial('templates/pick_game.hb');
        });
    });
});