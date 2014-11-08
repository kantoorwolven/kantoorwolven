class Player < ActiveRecord::Base
  # Associations
  belongs_to :game
  # has_many :votings

  before_create do |player|
    # game = player.game
    # if game.players.count > game.max_players
    #
    # end
  end
end
