Sammy('#main', function() {
    this.use('Handlebars', 'hb');
    this.get("#/clear_user", function() {
        localStorage.removeItem("kantoorwolven.player");
    });
}).run();