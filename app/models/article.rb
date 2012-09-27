#utf8
class Article < ActiveRecord::Base
  attr_accessible :category_id, :content, :title, :user_id,:status
  attr_accessible :tag_list
  #attr_accessor :tag_list
  
  acts_as_taggable
  acts_as_taggable_on :tags
  scope :by_join_date, order("created_at DESC")
  acts_as_commentable 
  #acts_as_commentable_on :comments

  belongs_to :user
  belongs_to :category
  has_many :comment


  STATUS = [["Published","1"],["Draft","2"]]
  end
