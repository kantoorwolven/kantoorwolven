Sammy('#main', function() {    
    
    var full = location.protocol+'//'+location.hostname;

    this.get("#/game/:id", function() {
        var zis = this;
        $.getJSON(full + ":3000" + "/games/" + this.params.id + ".json").then(function(data) {
            zis.name = data.name;
            zis.partial('templates/game.hb');
        });
    });
});