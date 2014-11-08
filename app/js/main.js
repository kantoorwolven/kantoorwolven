Sammy('#main', function() {
    
    var full = location.protocol+'//'+location.hostname;
    var port = (location.port ? ':'+location.port: '');
    
    this.use('Handlebars', 'hb');
    
    this.get('/', function() {
        var zis = this;
        this.something = true;
        this.title = 'Hello!';
        this.name = this.params.name;
        
        // render the template and pass it through handlebars
        this.partial('templates/home.hb');
        
        setTimeout(function() {
            zis.redirect('#/pick_game');
        }, 1000);
    });
    
    this.get("#/pick_game", function () {
        var zis = this;
    
        $.getJSON(full + ":3000" + "/games.json", function(games){
            zis.games = games;
            
            this.partial('templates/pick_games.hb');
        });
    });
}).run();
