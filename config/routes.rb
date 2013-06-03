Fg::Application.routes.draw do


  match 'settings', :to => "settings#index"

  root :to => "dashboard#index"


  match "/auth/:provider/callback", :to => 'session#create'
  match "/logout", :to => "session#destroy"
  match "/login", :to => "session#new"
  match "register", :to => "account#register"
end
