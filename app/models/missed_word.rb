class MissedWord < ActiveRecord::Base
  attr_accessible :count
  
  belongs_to :user
  belongs_to :item
end
