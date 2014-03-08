class Review < ActiveRecord::Base
  attr_accessible :script, :link, :reader, :recommendation

  belongs_to :script
  belongs_to :reader, :class_name => "AdminUser"
end
