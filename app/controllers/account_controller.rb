class AccountController < ApplicationController
  def register
    @identity = Identity.new
  end
end
