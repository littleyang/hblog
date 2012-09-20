class Category < ActiveRecord::Base
  attr_accessible :categoryDesc, :categoryName
  has_many :article
end
