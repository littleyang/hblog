class Link < ActiveRecord::Base
  attr_accessible :linkDesc, :title, :url, :user_id
  belongs_to :user
end
