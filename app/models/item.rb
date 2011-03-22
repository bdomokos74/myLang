class Item < ActiveRecord::Base
  acts_as_taggable_on :tags
  
  attr_accessible :expression, :translation  
  default_scope :order => 'items.created_at DESC'

  belongs_to :user
  
  validates :user_id, :presence => true
  validates :expression, :presence => true, :length => { :minimum => 1}
  validates :translation, :presence => true, :length => { :minimum => 1}
end
