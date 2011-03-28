class User < ActiveRecord::Base
  attr_accessible :name
  has_many :items
  has_many :quizzes
  has_many :missed_words
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
    end
  end
end
