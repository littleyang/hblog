class User < ActiveRecord::Base
  attr_accessible :userDesc, :userName, :userPassword
  has_many :article
  has_many :info
end
