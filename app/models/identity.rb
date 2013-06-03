class Identity < OmniAuth::Identity::Models::ActiveRecord
  attr_accessible :email, :password_digest, :username, :password, :password_confirmation
end
