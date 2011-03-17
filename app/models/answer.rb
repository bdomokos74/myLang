class Answer < ActiveRecord::Base
  attr_accessible :text
  belongs_to :quiz
end
