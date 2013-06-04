Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity, :fields => [:email], :model => Identity, on_failed_registration: lambda { |env|    
    AccountController.action(:register).call(env)
  }
end
