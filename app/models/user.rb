class User < ActiveRecord::Base
  has_many :posts # assumes Post has a user_id column
  has_many :comments
end
