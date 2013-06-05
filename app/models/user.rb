class User < ActiveRecord::Base
  attr_accessible :email, :nickname, :username, :is_admin

  has_many :authentications

  #before_save {|user| user.email = email.downcase}
  before_save :create_remember_token

  def self.auth_or_create(auth)
    authentication = Authentication.where(:provider => auth[:provider], :uid => auth[:uid]).first_or_create
    return authentication.user unless authentication.user.nil?
    
    authentication.user = User.where(:email => auth.info.email).first_or_create
    authentication.save
    return authentication.user unless authentication.user.nil?

    return nil
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64 if self.remember_token.nil?
    end

end
