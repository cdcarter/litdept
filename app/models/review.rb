class Review < ActiveRecord::Base
  attr_accessible :script, :link, :reader, :recommendation, :link_cache, :remove_link, :script_id, :reader_id

  belongs_to :script
  belongs_to :reader, :class_name => "AdminUser"

  mount_uploader :link, ReviewDocUploader
end