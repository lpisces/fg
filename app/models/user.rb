class User < ActiveRecord::Base
  attr_accessible :email, :nickname, :username

  has_many :authentications

  def self.auth_or_create(auth)
    authentication = Authentication.where('provider = ? and uid = ?', auth[:provider], auth[:uid]).first_or_create
    return authentication.user unless authentication.user.nil?
    
    authentication.user = User.create({:email => auth.info.email})
    return authentication.user unless authentication.user.nil?

    return nil
  end
end
