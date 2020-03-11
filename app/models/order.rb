class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  has_many :cart_items, through: :cart
  
end
