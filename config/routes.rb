Fg::Application.routes.draw do

  root :to => "dashboard#index"

  # login/logout/regsiter
  match '/auth/:provider/callback', :to => 'session#create'
  match '/logout', :to => "session#destroy"
  match '/login', :to => "session#new"
  match '/register', :to => "account#register"
  match '/auth/identity/register', :to => "account#register"

  # settings
  match '/settings', :to => "settings#index"
  match '/settings/about', :to => "settings#about"
  match '/settings/contact', :to => "settings#contact"
  match '/settings/sysconfig', :to => "settings#sysconfig"
end
