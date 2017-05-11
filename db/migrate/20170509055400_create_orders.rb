class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :name
      t.integer :phone
      t.text :address
      t.string :email
      t.integer :amount
      t.string :payment_method

      t.timestamps
    end
  end
end
