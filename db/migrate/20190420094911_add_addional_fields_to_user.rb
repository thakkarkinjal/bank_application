class AddAddionalFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :mobile, :string
    add_column :users, :account_type, :string
    add_column :users, :account_no, :string
    add_column :users, :total_balance, :float, :default => 0.0
  end
end
