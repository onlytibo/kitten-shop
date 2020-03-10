class RemoveSlugsFromCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :slug, :string
  end
end
