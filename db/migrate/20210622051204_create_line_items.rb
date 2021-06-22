class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.belongs_to :product
      t.belongs_to :order
      t.belongs_to :customer
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
