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
  match '/settings/about_save', :to => "settings#about_save"
  match '/settings/contact', :to => "settings#contact"
  match '/settings/contact_save', :to => "settings#contact_save"
  match '/settings/sysconfig', :to => "settings#sysconfig"
  match '/settings/sysconfig_save', :to => "settings#sysconfig_save"

  #resource
  resources :items
  resources :tags
  resources :categories

  #front
  match '/home', :to => 'home#index'

  #node category
  match '/node/:id', :to => 'node#show'

  #game
  match "/game/:id", :to => 'game#show'

  # home tags config 
  match "/home_tags", :to => 'home_tags#setting'
  match "/home_tags/config", :to => 'home_tags#setting'
  match "/home_tags/config_save", :to => 'home_tags#setting_save'

  #sidekiq
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
