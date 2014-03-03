class Playwright < ActiveRecord::Base
  attr_accessible :name, :email, :city, :state, :local, :relationship

  has_many :scripts
end
