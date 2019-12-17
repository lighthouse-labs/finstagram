class Like < ActiveRecord::Base

  belongs_to :user
  belongs_to :finstagram_post

end

class Like < ActiveRecord::Base

  # ...

  validates_presence_of :user, :finstagram_post

end