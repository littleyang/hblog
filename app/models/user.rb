class User < ActiveRecord::Base
  attr_accessible :userDesc, :userName, :userPassword,:email
  has_many :article
  has_many :info
  has_many :comment
  has_many :link
  
  validates_presence_of :userPassword,:userName
  validates_uniqueness_of :userName,:message =>"has a same username"
  validates_uniqueness_of :email,:message=>"has a same email"
  
  def user_authentication

  end

  protected 
  
  def self.encrypt

  end

  def self.psalt
    
  end


end
