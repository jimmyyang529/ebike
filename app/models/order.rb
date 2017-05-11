class Order < ApplicationRecord
  has_many :orderitem_ships, dependent: :destroy
  has_many :items, through: :orderitem_ships
  belongs_to :user

  validates_presence_of :name, :email, :address, :phone,:payment_method

  def add_order_items(cart)
    cart.cart_items.each do |i|
      self.orderitem_ships.build( item_id: i.item.id,
                              quantity: i.quantity,
                              price: i.item.price
                            )
    end
    self.amount = cart.total
  end


end
