class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :brand_name
      t.date :created_date
      t.string :image_url

      t.timestamps
    end
  end
end
