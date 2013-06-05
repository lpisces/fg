class SettingsController < ApplicationController
  layout 'admin'
  include SessionHelper

  before_filter :require_admin

  def index
    redirect_to :settings_sysconfig
  end

  def sysconfig
  end

  def about
  end

  def contact
  end

end
