class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  def add_cart_item(item)
    existing_item = self.cart_items.find_by( item_id: item.id )
    if existing_item
      existing_item.quantity += 1
      existing_item.save!
    else
      cart_item = cart_items.build( item_id: item.id )
      cart_item.save!
    end
    self.cart_items
  end

  def total_quantity
    cart_items.map{ |x| x.quantity }.sum
  end

  def total
    cart_items.map{ |x| x.subtotal }.sum
  end




end
