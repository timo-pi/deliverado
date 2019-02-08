class AddSignatureToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :signature, :string

  end
end
