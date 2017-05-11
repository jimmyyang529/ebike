class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  def subtotal
    self.quantity * self.item.price
  end

end
