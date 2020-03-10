class AddIsOrdererToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :is_ordered, :boolean
  end
end
