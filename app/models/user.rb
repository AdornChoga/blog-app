class User < ApplicationRecord
  has_many :users
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable
end
