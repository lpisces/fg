Fg::Application.routes.draw do

  resources :categories


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
  match '/settings/about_save', :to => "settings#about_save"
  match '/settings/contact', :to => "settings#contact"
  match '/settings/contact_save', :to => "settings#contact_save"
  match '/settings/sysconfig', :to => "settings#sysconfig"
  match '/settings/sysconfig_save', :to => "settings#sysconfig_save"
end
