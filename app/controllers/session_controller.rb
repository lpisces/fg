class SessionController < ApplicationController
  layout 'admin'

  def create
    user = User.auth_or_create(request.env['omniauth.auth'])
    debugger
    sign_in(user)
    redirect_to '/'
  end

  def destroy
  end

  def new
  end

end
