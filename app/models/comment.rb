class Comment < ActiveRecord::Base
  
  belongs_to :finstagram_post
  belongs_to :user
  
end