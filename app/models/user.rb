class User < ActiveRecord::Base
  attr_accessible :userDesc, :userName, :userPassword
  has_many :article
end
