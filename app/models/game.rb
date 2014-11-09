class Game < ActiveRecord::Base
  # Associations
  has_many :rounds
  has_many :players
  has_many :werewolves
  has_many :villagers

  def starttime=(seconds)
    Time.at(seconds).to_datetime
  end

  def self.activate_rounds
    Game.all.each do |game|
      if game.rounds.active.empty?
        if Time.zone.now > game.starttime
          game.rounds.first.activate!
        end
      end
    end
  end

  def self.close_rounds
    Game.all.each do |game|
      game.rounds.active.each do |round|
        next if Time.zone.now < round.deadline
        round.inactivate!
        round.next.activate! if round.next
      end
    end
  end

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
      self.rounds.create! deadline: time, active: false, type: type
    end
  end
end
