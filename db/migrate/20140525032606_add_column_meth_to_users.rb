class AddColumnMethToUsers < ActiveRecord::Migration
  def change
    add_column :users, :meth, :integer
  end
end
