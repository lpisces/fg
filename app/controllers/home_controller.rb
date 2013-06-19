class HomeController < ApplicationController
  layout 'admin', :except => [:index]

  def index
    render :layout => 'front'
  end

end
