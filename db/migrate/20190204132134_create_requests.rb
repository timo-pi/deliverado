class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :order_number
      t.string :delivery_address
      t.string :size
      t.text :message
      t.datetime :time_from
      t.datetime :time_to
      t.string :phone_number
      t.string :customer_email

      t.timestamps
    end
  end
end
