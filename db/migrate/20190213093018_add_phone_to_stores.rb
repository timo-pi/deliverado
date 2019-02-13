class AddPhoneToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :phone_number, :string
  end
end
