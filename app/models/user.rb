class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, 
                  :remember_me, :role_ids
  
  has_many :articles
  has_many :comments
  has_many :assignments
  has_many :roles, :through => :assignments
  
  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end
end
