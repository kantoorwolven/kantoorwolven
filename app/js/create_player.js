Sammy('#main', function() {    
    
    var full = location.protocol+'//'+location.hostname;
    this.get("#/create_player", function() {
        this.partial('templates/create_player.hb');
    });
    
    this.post("#/create_player", function() {
        var player = {
            name: this.params.name,
            email: this.params.email
        };
        localStorage.setItem("kantoorwolven.player", player);
    });
});