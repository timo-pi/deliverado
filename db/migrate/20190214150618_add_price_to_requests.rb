class AddPriceToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :price, :integer
  end
end
