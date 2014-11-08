class AddFieldsToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :email, :string
    add_column :players, :type, :string
  end
end
