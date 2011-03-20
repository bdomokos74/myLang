class Answer < ActiveRecord::Base
  attr_accessible :text
  belongs_to :quiz
  default_scope :order => 'answers.created_at'
end
