class CreateImports < ActiveRecord::Migration[6.1]
  def change
    create_table :imports do |t|
      t.string :file_name

      t.timestamps
    end
  end
end
