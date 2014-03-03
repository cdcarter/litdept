class Script < ActiveRecord::Base
  attr_accessible :title, :year, :playwright_id, :playwright, :males, :females, :other, :link, :sent_to

  belongs_to :playwright
end
