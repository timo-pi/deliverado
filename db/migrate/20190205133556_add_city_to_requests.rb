class AddCityToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :city, :string
  end
end
