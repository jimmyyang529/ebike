class Order < ApplicationRecord
  has_many :orderitem_ships, dependent: :destroy
  has_many :items, through: :orderitem_ships
  belongs_to :user
  has_many :payments

  validates_presence_of :name, :email, :address, :phone,:payment_method

  enum payment_method: [ :credit_card, :atm]
  enum order_status: [ :new_order, :paid, :shipped, :cancelled]
  enum payment_status: [ :atm_pending, :atm_paid, :credit_pending,:credit_paid]

  def paid?
    self.order_status == "paid"
  end


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
