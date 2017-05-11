class Order < ApplicationRecord
  has_many :orderitem_ships, dependent: :destroy
  has_many :items, through: :orderitem_ships
  belongs_to :user

  validates_presence_of :name, :email, :address, :phone,:payment_method

  


end
