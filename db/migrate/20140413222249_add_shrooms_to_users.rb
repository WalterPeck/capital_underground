class AddShroomsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shrooms, :integer
  end
end
