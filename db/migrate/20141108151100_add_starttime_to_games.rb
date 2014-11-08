class AddStarttimeToGames < ActiveRecord::Migration
  def change
    add_column :games, :starttime, :datetime
  end
end
