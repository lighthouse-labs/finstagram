class Like < ActiveRecord::Base

  # ...

  validates_presence_of :user, :finstagram_post

end