require 'spec_helper'

describe ItemsController do
  render_views
  
  describe "access control" do
    it "should deny access to create" do
      post :create
      response.should redirect_to(root_path)
    end
    
    it "should deny access to destroy" do
      delete :destroy, :id => 1
      response.should redirect_to(root_path)
    end
  end
  
  describe "POST 'create'" do
    before(:each) do
      @user = test_sign_in(Factory(:user))
    end
    
    describe "failure" do
      before(:each) do
        @attr = { :expression => "", :translation => "blah"}
      end
      
      it "should not create the item" do
        lambda do
          post :create, :item => @attr
        end.should_not change(Item, :count)
      end
      
      it "should render the root page" do
        post :create, :item => @attr
        response.should redirect_to(root_path)
      end
    end
    
    describe "success" do
      before(:each) do
        @attr = { :expression => "hah", :translation => "blah"}
      end
      
      it "should create an item" do
        lambda do
          post :create, :item => @attr
        end.should change(Item, :count).by(1)
      end
      
      it "should redirect to the items page" do
        post :create, :item => @attr
        response.should redirect_to(items_path)
      end
      
      it "should have a flash message" do
        post :create, :item => @attr
        flash[:success].should =~ /item created/i
      end
    end
  end
  
  describe "DELETE 'destroy'" do
    before(:each) do
      @user = test_sign_in(Factory(:user))
      @other_user = Factory(:other_user)
      @item1 = Factory(:item1, :user => @user)
      @other_item1 = Factory(:other_item1, :user => @other_user)
    end
    
    describe "for unauthorized user" do
      it "should deny access" do
        delete :destroy, :id => @other_item1.id
        response.should redirect_to(root_path)
      end
    end
    
    describe "for authorized user" do
      it "should delete item" do
        lambda do
          delete :destroy, :id => @item1.id
        end.should change(Item, :count).by(-1)
      end
    end
    
  end
  
  describe "GET 'index'" do
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user.id)
    end
    
    it "should show every user's items" do
      it1 = Factory(:item1, :user => @user)
      it2 = Factory(:item2, :user => @user)
      user2 = Factory(:other_user)
      it3 = Factory(:other_item1, :user => user2)
      
      get :index
      response.should have_selector("span.expression", :content => "one")
      response.should have_selector("span.translation", :content => "uno/una")
      response.should have_selector("span.expression", :content => "two")
      response.should have_selector("span.translation", :content => "dos")
      response.should have_selector("span.expression", :content => "three")
      response.should have_selector("span.translation", :content => "tres")
    end
  end
end

