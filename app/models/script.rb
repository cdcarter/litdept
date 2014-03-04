class Script < ActiveRecord::Base
  attr_accessible :title, :year, :playwright_id, :playwright, :males, :females, :other, :link, :sent_to,
  	:requested_by, :sent_by, :rights_holder, :must_read

  belongs_to :playwright
end
