Sammy('#main', function() {
    this.post('#/vote', function () {
        $.ajax({
            url: "/games/" + this.params.game_id + "/rounds/" + this.params.round_id + "/votings.json",
            type: "POST",
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify({votings: {
                voter_id: this.params.player_id,
                voted_id: this.params.voted_id
            }})
        });
        this.redirect('#/game/' + this.params.game_id);
    });
});