class Game < ActiveRecord::Base
  # Associations
  has_many :rounds
  has_many :players

  def self.build_rounds
    Game.all.each do |game|
      next if game.rounds.any?
      next if game.players.size < 8
      next if Time.zone.now < game.starttime
      rounds = game.players.size - 2
      now = Time.zone.now
      day = now.day

      rounds.times do |round|
        day = day + 1 if round.odd?
        day = day + 1 if 
        hour   = round.even? ? 22 : 16
        minute = round.even? ? 0  : 30
        type   = round.even? ? 'Night' : 'Day'
        game.rounds.create deadline: Time.new(now.year, now.month, day, hour, minute, 0),
                           active:   round == 0,
                           type:     type
      end
    end
  end
end
