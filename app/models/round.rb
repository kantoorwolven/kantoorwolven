class Round < ActiveRecord::Base
  # Associations
  belongs_to :game
  has_many :votes
end