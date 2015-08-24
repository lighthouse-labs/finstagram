class User < ActiveRecord::Base

  has_many :posts
  has_many :comments
  has_many :likes

  validates_presence_of :email,
                        :avatar_url,
                        :username,
                        :password

  validates_uniqueness_of :email,
                          :username

  def like_for_post_id(post_id)
    likes.find_by post_id: post_id
  end

end