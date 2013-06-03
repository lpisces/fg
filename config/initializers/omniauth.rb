Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity, :fields => [:email, :username], :model => Identity
end