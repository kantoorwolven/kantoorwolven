class Player < ActiveRecord::Base
  # Associations
  belongs_to :game

  # Validations
  validates :email, uniqueness: {scope: :game_id}

  before_create do |player|
    player.type = choose_a_type
  end

  def choose_a_type
    ['Werewolf', 'Villager', 'Villager', 'Villager'].sample
  end
end
