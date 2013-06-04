# encoding : utf-8
class Identity < OmniAuth::Identity::Models::ActiveRecord
  attr_accessible :email, :password_digest, :username, :password, :password_confirmation

  validates :email, :uniqueness => {:case_sensitive => false, :message => "Email 已经存在。"}
  validates :password, :confirmation => {:message => '密码输入不一致。'}
  validates :password_confirmation, :presence => {:message => '请再次输入密码。'}
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :message => 'Email 格式非法。'
end
