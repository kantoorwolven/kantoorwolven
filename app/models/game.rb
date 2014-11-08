class Game < ActiveRecord::Base
  # Associations
  has_many :rounds
  has_many :players

  def self.build_rounds
    Game.all.each do |game|
      next if game.rounds.any?
      next if game.players.size < 8
      next if Time.zone.now < game.starttime
      game.build_rounds_without_skips
    end
  end

  def build_rounds_without_skips
    rounds = self.players.size - 2
    now = Time.zone.now
    day = now.day

    rounds.times do |round|
      hour   = round.even? ? 22 : 16
      minute = round.even? ? 0  : 30
      type   = round.even? ? 'Night' : 'Day'
      time   = Time.new(now.year, now.month, day, hour, minute, 0)
      time   = time + 1.day if round.odd?
      self.rounds.create! deadline: time, active: round == 0, type: type
    end
  end
end
