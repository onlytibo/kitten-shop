class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.timestamps
      t.string :name
      t.string :email
    end
  end
end
