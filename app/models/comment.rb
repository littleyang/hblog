class Comment < ActiveRecord::Base
  attr_accessible :comment, :email, :nikeName,:article_id
  belongs_to :article
end
