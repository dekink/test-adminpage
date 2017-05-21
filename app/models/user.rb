class User < ActiveRecord::Base
  rolify
  include Authority::UserAbilities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  after_create :assign_default_role, if: Proc.new { User.count > 1 }
  has_many :posts
  
  #validates
  
  private
  def assign_default_role
      add_role :user
  end
  
end
