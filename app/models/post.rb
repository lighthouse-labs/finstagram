class Post < ActiveRecord::Base
  belongs_to :user # assumes there is a user_id colum
  has_many :comments
end
