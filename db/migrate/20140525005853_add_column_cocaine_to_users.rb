class AddColumnCocaineToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cocaine, :integer
  end
end
