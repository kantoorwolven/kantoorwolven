class Player < ActiveRecord::Base
  # Associations
  belongs_to :game
  # has_many :votings
end
