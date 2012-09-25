class Article < ActiveRecord::Base
  attr_accessible :category_id, :content, :title, :user_id
  
  acts_as_taggable
  acts_as_taggable_on :tags
  scope :by_join_date, order("created_at DESC")
  acts_as_commentable 
  #acts_as_commentable_on :comments

  belongs_to :user
  belongs_to :category
  has_many :comment

  def self.list_tags
    tag_list = Tag.find(:all,:group=>'name',:order=>'name asc')
    return tag_list
  end

end
