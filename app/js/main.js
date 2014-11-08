Sammy('#main', function() {
    
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
    
//    // define a 'get' route that will be triggered at '#/path'
//    this.get('#/', function() {
//          this.title = 'Hello!';
//          this.name = this.params.name;
//          // render the template and pass it through handlebars
//          this.partial('templates/home.hb');
//    });
    
    this.get("#/pick_game", function () {
        
    });
}).run();
