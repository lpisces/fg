class AccountController < ApplicationController
  layout 'admin'
  include SessionHelper
  def register
    @identity = env['omniauth.identity']
  end
end
