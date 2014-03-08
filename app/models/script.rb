class Script < ActiveRecord::Base
  attr_accessible :title, :year, :playwright_id, :playwright, :males, :females, :other, :link, :sent_to,
  	:requested_by, :sent_by, :rights_holder, :must_read, :link_cache, :remove_link

  belongs_to :playwright

  mount_uploader :link, ScriptDocUploader
end
