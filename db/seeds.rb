games = Game.create [
  {name: 'Launch Cafe',   starttime: Time.local(2014,"nov",9,17,30,0), max_players: 30},
  {name: 'Het Kasteel',   starttime: Time.local(2014,"nov",9,17,30,0), max_players: 100},
  {name: 'De Uurwerker',  starttime: Time.local(2014,"nov",9,17,30,0), max_players: 50},
  {name: 'Doppio',        starttime: Time.local(2014,"nov",9,17,30,0), max_players: 50},
  {name: 'Black & Bloom', starttime: Time.local(2014,"nov",9,17,30,0), max_players: 50}
]


games.each do |game|
  (30..game.max_players).to_a.sample.times do
    game.players.create name: Faker::Name.name, email: Faker::Internet.email
  end
  game.build_rounds_without_skips
end
