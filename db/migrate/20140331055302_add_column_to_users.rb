class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dealer, :string
  end
end
