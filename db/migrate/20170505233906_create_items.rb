class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :img_url
      t.integer :manufacture_year
      t.string :frame
      t.string :fork
      t.string :size
      t.string :color
      t.integer :price
      t.text :description
      t.integer :brand_id
      t.integer :category_id
      t.boolean :is_check

      t.timestamps
    end
  end
end
