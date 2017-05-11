class CreateOrderitemShips < ActiveRecord::Migration[5.0]
  def change
    create_table :orderitem_ships do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
