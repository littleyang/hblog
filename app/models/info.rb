class Info < ActiveRecord::Base
  attr_accessible :detail, :title, :user_id
  belongs_to :user
end
