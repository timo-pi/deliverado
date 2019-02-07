class Store < ApplicationRecord
  has_many :requests, dependent: :destroy
end
