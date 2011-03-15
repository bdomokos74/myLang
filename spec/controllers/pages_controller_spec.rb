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

  describe "GET 'dashboard'" do
    it "should be successful" do
      get 'dashboard'
      response.should be_success
    end
  end

  describe "GET 'words'" do
    before(:each) do
      @user = Factory(:user)
    end
    
    it "should show the user's items" do
      it1 = Factory(:item, :user => @user, :expression => "one", :translation => "uno/una")
      it2 = Factory(:item, :user => @user, :expression => "two", :translation => "dos")
      test_sign_in(@user.id)
      get :words
      response.should have_selector("span.expression", :content => "one")
      response.should have_selector("span.translation", :content => "uno/una")
      response.should have_selector("span.expression", :content => "two")
      response.should have_selector("span.translation", :content => "dos")

    end
  end
end
