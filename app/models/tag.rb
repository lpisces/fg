class Tag < ActiveRecord::Base
  attr_accessible :name, :sort

  belongs_to :item
end
