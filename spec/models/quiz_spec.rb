require 'spec_helper'

describe Quiz do
  before(:each) do
    @user = Factory(:user)
  end

  it "should create a new instance" do
    @user.quizzes.create!()
  end
  
  describe "new quiz" do
    before(:each) do
      @quiz = @user.quizzes.create!()
    end
    
    it "should have 'created' status" do
      @quiz.status.should == 'created'
    end
  end
  
end
