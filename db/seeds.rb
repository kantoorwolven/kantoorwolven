games = Game.create [
  {name: 'Launch Cafe',   starttime: Chronic.parse('sunday 17:30'), max_players: 30},
  {name: 'Het Kasteel',   starttime: Chronic.parse('sunday 17:30'), max_players: 100},
  {name: 'De Uurwerker',  starttime: Chronic.parse('sunday 17:30'), max_players: 50},
  {name: 'Doppio',        starttime: Chronic.parse('sunday 17:30'), max_players: 50},
  {name: 'Black & Bloom', starttime: Chronic.parse('sunday 17:30'), max_players: 50}
]


games[1].max_players.times do
  games[1].players.create name: Faker::Name.name, email: Faker::Internet.email
end

games[1].build_rounds_without_skips
