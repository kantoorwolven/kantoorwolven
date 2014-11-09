class AddDeadToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :dead, :boolean, default: false
  end
end
