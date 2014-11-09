class Round < ActiveRecord::Base
  # Associations
  belongs_to :game
  has_many :votings

  def next
    game.rounds.where('deadline > ?', self.deadline).first
  end

  def activate!
    update active: true
  end

  def inactivate!
    update active: false
  end
end
