class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  	:real_name, :title, :inactive
  # attr_accessible :title, :body

  has_many :reviews, :foreign_key => :reader_id

  def active_for_authentication?
    super && self.active?
  end

  def inactive_message
    "Sorry, this account has been deactivated."
  end
end
