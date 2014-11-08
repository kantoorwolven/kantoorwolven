class CreateVotings < ActiveRecord::Migration
  def change
    create_table :votings do |t|
      t.references :round, index: true
      t.references :voter, index: true
      t.references :voted, index: true

      t.timestamps
    end
  end
end
