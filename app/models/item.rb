class Item < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :brand, optional: true

  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  #find_item_by(item) 方法,這是為了在 JavaScript 腳本裡讀取購物車商品資訊作準備。
  def find_item_by(item)
    self.cart_items.where(item_id: item).first
  end

  def permalink
    "#{self.name}"
  end

  def to_param
    "#{id}-#{permalink}"
  end

end
