class User < ApplicationRecord
  has_many :users
  has_many :likes, as: :likeable
end
