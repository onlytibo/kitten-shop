class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :img_link
      t.timestamps
    end
  end
end
