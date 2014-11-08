class Voting < ActiveRecord::Base
  belongs_to :round
  belongs_to :voter
  belongs_to :voted
end
