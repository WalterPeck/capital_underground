class AddMollyColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :molly, :integer
  end
end
