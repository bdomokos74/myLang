require 'spec_helper'

describe SessionsController do
  render_views
  
  describe "POST 'dev_signin'" do
    describe "invalid signin" do      
      it "should re-render the new page" do
        post :dev_signin, :user => {:name =>"example1_wrong"}
        flash.now[:error].should =~ /invalid/i
      end
    end
    
    describe "successfull signin" do
      before(:each) do
        @user = Factory(:user)
      end
      
      it "should have the flash" do
        post :dev_signin, :user => {:name =>"example1"}
        flash.now[:success].should =~ /signed in/i
      end
    end
  end
end
