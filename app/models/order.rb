class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  after_create :order_send

  def order_send
    UserMailer.order_email(self).deliver_now
    UserMailer.admin_email(self).deliver_now
  end

  def total_amount_order(order_items)
      total = 0.00
      order_items.each do |order_item|
      total = order_item.item.price * order_item.quantity + total
      end
      return total
  end

end
