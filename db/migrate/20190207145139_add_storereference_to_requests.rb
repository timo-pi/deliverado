class AddStorereferenceToRequests < ActiveRecord::Migration[5.2]
  def change
    add_reference :requests, :store, foreign_key: true
  end
end
