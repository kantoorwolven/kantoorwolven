Sammy('#main', function() {    
    this.get("#/game/:id", function() {
        var zis = this;
        var player = JSON.parse(localStorage.getItem("kantoorwolven.player"));
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
                    zis.name = data.name;
                    zis.players = data.players;
                    zis.partial('templates/game.hb');
                });
            } else {
                zis.name = data.name;
                zis.players = data.players;
                zis.partial('templates/game.hb');
            }
        });
    });
});