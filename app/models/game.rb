class Game < ActiveRecord::Base
  # Associations
  has_many :rounds
  has_many :players

  before_create do |game|
    game.rounds.build
  end
end
