class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.integer :cart_id, index: true
      t.integer :item_id, null: false, index:true
      t.integer :quantity, default: 1
      t.timestamps null: false
    end
  end
end
