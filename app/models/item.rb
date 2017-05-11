class Item < ApplicationRecord
  belongs_to :category
  belongs_to :brand

  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

end
