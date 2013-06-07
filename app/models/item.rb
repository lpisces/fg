require 'carrierwave/orm/activerecord'
class Item < ActiveRecord::Base
  attr_accessible :bimg, :desc, :ename, :flash, :howto, :mimg, :name, :params, :simg, :size, :target


  mount_uploader :bimg, BimgUploader
  mount_uploader :simg, SimgUploader
  mount_uploader :flash, FlashUploader
end
