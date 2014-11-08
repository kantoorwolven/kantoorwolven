class Game < ActiveRecord::Base
  # Associations
  has_many :players

  after_create do |game|
    # return if game.rounds.any?
    # game.rounds.create
  end
end
