class User < ActiveRecord::Base
  has_many :departments
  has_many :registrations
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def admin_departments 
    departments
  end
  
  def admin?
    email =~ /admin/
  end
  
end
