class CartItems < ApplicationRecord
  belongs_to :cart 
  belongs_to :item

  def self.set_quantity_items_in_cart(id)
    @set_quantity = CartItems.where(cart_id: id)
    
    @quantity = Hash.new(0) 
    
    @set_quantity.each do |c| 
      @quantity[c.item_id] += 1
    end

    @set_quantity.each do |i|
      i.quantity = @quantity[i.item_id]
      i.save
    end

    return @quantity
  
  end
  
end
