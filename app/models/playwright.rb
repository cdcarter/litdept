class Playwright < ActiveRecord::Base
  attr_accessible :name, :email, :city, :state, :local, :relationship, :representation, 
  	:agent_contact, :contact

  has_many :scripts
end
