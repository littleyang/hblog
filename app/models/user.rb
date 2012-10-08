class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :userDesc, :username,:permission
  attr_accessor :login
  attr_accessible :login

  has_many :article
  has_many :info
  has_many :comment
  has_many :link

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  ROLES = [["admin","0"],["editor","1"],["viewer","2"]]


  #ivalidates_presence_of :userPassword,:userName
  #validates_uniqueness_of :username,:message =>"has a same username"
  #validates_uniqueness_of :email,:message=>"has a same email"
 
  #def userPassword=(pass)
  #  @userPassword = pass
  #  salt = User.salt
  #  self.userPassword = User.encrypt(@userPassword,self.salt)
  #end


  #def user_authentication

  #end

  #protected 
 # 
 # def self.encrypt(userPassowrd,salt)
 #   return (userPassword+salt)
 # end
#
 # def self.salt
 #    return "myblog"
 # end


end
