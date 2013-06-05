# encoding : utf-8
class SettingsController < ApplicationController
  layout 'admin'
  include SessionHelper

  before_filter :require_admin

  def index
    redirect_to :settings_sysconfig
  end

  def sysconfig
    @title = Sysconfig.where(:key => 'title').first_or_create
    @keywords = Sysconfig.where(:key => 'keywords').first_or_create
    @description = Sysconfig.where(:key => 'description').first_or_create
  end

  def sysconfig_save
    @title = Sysconfig.where(:key => 'title').first_or_create
    @keywords = Sysconfig.where(:key => 'keywords').first_or_create
    @description = Sysconfig.where(:key => 'description').first_or_create

    @title.update_attribute(:value, params[:title])
    @keywords.update_attribute(:value, params[:keywords])
    @description.update_attribute(:value, params[:description])

    redirect_to :settings_sysconfig, :notice => '更新成功'
  end

  def about
    @about = Sysconfig.where(:key => 'about').first_or_create
  end

  def about_save
    @about = Sysconfig.where(:key => 'about').first_or_create
    @about.update_attribute(:value, params[:about])
    redirect_to :settings_about, :notice => '更新成功'
  end

  def contact
    @contact = Sysconfig.where(:key => 'contact').first_or_create
  end

  def contact_save
    @contact = Sysconfig.where(:key => 'contact').first_or_create
    @contact.update_attribute(:value, params[:contact])
    redirect_to :settings_about, :notice => '更新成功'
  end

end
