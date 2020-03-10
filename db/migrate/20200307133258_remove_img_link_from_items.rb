class RemoveImgLinkFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :img_link, :string
  end
end
