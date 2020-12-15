class User < ActiveRecord::Base

  # ... The rest of your code is still here ...

  # --- Add these lines ---
  validates :email, :username, uniqueness: true
  validates :email, :avatar_url, :username, :password, presence: true
  # -----------------------

end