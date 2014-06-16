class AddOxyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :oxy, :integer
  end
end
