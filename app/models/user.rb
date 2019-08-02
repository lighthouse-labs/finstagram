class User < ActiveRecord::Base
  
  has_many :finstagram_post
  has_many :like
  has_many :comment
  
end
