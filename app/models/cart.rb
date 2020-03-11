class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def self.total_cart(id)
    @cart_items = CartItems.where(cart_id: id)
    @total = 0
    
    @cart_items.each do |cart_item|
      @total = @total + cart_item.item.price
    end
    return @total
  end


end
