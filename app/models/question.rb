class Question < ActiveRecord::Base
  attr_accessible :item_id
  belongs_to :quiz
  belongs_to :item
  default_scope :order => 'questions.created_at'
end
