require 'spec_helper'

describe PagesController do
  render_views
  
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'home'
      response.should have_selector("title", :content => "myLang | Home")
    end
  end
  
  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
  end
  
  describe "signed in users" do
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user.id)
    end
    
    describe "GET 'dashboard'" do
      it "should be successful" do
        get 'dashboard'
        response.should be_success
      end
    end
    
    describe "GET 'words'" do
      it "should show every user's items" do
        it1 = Factory(:item1, :user => @user)
        it2 = Factory(:item2, :user => @user)
        user2 = Factory(:other_user)
        it3 = Factory(:other_item1, :user => user2)
        
        get :words
        response.should have_selector("span.expression", :content => "one")
        response.should have_selector("span.translation", :content => "uno/una")
        response.should have_selector("span.expression", :content => "two")
        response.should have_selector("span.translation", :content => "dos")
        response.should have_selector("span.expression", :content => "three")
        response.should have_selector("span.translation", :content => "tres")
      end
    end
  end
end
