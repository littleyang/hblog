class Article < ActiveRecord::Base
  attr_accessible :category_id, :content, :title, :user_id
  acts_as_taggable
  acts_as_taggable_on :tags
  belongs_to :user
  belongs_to :category
  has_many :comment

end
