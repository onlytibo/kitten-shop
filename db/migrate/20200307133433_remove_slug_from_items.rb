class RemoveSlugFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :slug, :string
  end
end
