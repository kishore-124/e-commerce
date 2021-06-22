class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :customer
      t.boolean :complete
      t.string :transaction_id
      t.belongs_to :product

      t.timestamps
    end
  end
end
