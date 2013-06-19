class HomeTagsController < ApplicationController

  layout 'admin'
  include SessionHelper
  before_filter :require_admin

  def setting
  end

  def setting_save
  end

end
