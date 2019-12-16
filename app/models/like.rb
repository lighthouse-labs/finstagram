class Like < ActiveRecord::Base

  belongs_to :user
  belongs_to :finstagram_post

end