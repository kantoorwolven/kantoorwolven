class Voting < ActiveRecord::Base
  # Associations
  belongs_to :round
  belongs_to :voter, class_name: 'Player', foreign_key: :voter_id
  belongs_to :voted, class_name: 'Player', foreign_key: :voted_id

  # Validations
  validates :voter_id, uniqueness: {scope: [:round_id, :voted_id]}
end
