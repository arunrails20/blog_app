class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :blogs
  has_one :profile
  belongs_to :role
  
  #list all the blog based on the user role
  def list_blog
    self.role && self.role_name == "Admin" ? Blog.all : self.blogs
  end
  
  def role_name
    self.role.name
  end
end
