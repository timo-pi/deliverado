class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.string :store_address
      t.string :store_city

      t.timestamps
    end
  end
end
