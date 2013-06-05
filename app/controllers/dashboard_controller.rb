class DashboardController < ApplicationController
  layout 'admin'
  include SessionHelper
  before_filter :require_signed_in
  def index
  end
end
