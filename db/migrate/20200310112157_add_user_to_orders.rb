class AddUserToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :orders, foreign_key: true
  end
end
