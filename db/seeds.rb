games = Game.create [
  {name: 'Launch Cafe',   starttime: Chronic.parse('sunday 17:30'), max_players: 30},
  {name: 'Het Kasteel',   starttime: Chronic.parse('sunday 17:30'), max_players: 100},
  {name: 'De Uurwerker',  starttime: Chronic.parse('sunday 17:30'), max_players: 50},
  {name: 'Doppio',        starttime: Chronic.parse('sunday 17:30'), max_players: 50},
  {name: 'Black & Bloom', starttime: Chronic.parse('sunday 17:30'), max_players: 50}
]


games.each do |game|
  (30..game.max_players).to_a.sample.times do
    game.players.create name: Faker::Name.name, email: Faker::Internet.email
  end
  game.build_rounds_without_skips
end
