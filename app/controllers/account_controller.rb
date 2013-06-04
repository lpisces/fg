class AccountController < ApplicationController
  layout 'admin'
  def register
    @identity = env['omniauth.identity']
  end
end
