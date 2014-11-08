class Game < ActiveRecord::Base
  # Associations
  has_many :players
end
