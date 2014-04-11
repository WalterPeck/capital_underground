class AddWeedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :weed, :integer
  end
end
