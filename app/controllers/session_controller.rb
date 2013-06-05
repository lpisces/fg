class SessionController < ApplicationController
  layout 'admin'
  include SessionHelper

  def create
    user = User.auth_or_create(request.env['omniauth.auth'])
    sign_in(user)
    redirect_to root_path
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  def new
  end

end
