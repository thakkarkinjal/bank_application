class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.references :user, foreign_key: true
      t.float :amount
      t.integer :recipient_id

      t.timestamps
    end
  end
end
