
Sammy('#main', function() {
    
    this.get('/', function() {
        var zis = this;
        this.something = true;
        this.title = 'Hello!';
        this.name = this.params.name;
        
        // render the template and pass it through handlebars
        this.partial('templates/home.hb');
        
        setTimeout(function() {
            if (localStorage.getItem("kantoorwolven.player")) {
                zis.redirect('#/pick_game');
            } else {
                zis.redirect('#/create_player');
            }
        }, 1000);
    });
});