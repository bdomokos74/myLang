class Quiz < ActiveRecord::Base  
  belongs_to :user  
  has_many :questions
  has_many :answers
  
  after_initialize :init
  
  def init
    self[:status] ||= "created"
    self[:curr_step] ||= 0
    self[:score] ||= -1
  end
  
  def curr_step=(curr)
    self[:curr_step] = curr
  end
  
  def curr_step
    self[:curr_step]
  end
  
  def status=(st)
    self[:status] = st
  end
  
  def status
    self[:status]
  end
end
