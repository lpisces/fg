class Tag < ActiveRecord::Base
  attr_accessible :name, :sort

  has_and_belongs_to_many :items
end
