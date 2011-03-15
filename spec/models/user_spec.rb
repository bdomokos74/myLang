require 'spec_helper'

describe User do

  before(:each) do
    @attr = {"provider" => "testprovider", "uid" => "testuid", "user_info" => { "name" => "testname"}}
  end

  describe "attributes" do
    before(:each) do
      @user = User.create_with_omniauth(@attr)
    end
    
    it "should respond to provider" do
      @user.should respond_to(:provider)
    end  

    it "should respond to uid" do
      @user.should respond_to(:uid)
    end  

  end
  
  describe "create_with_omniauth" do
    it "should create a new user" do
      lambda do
        @attr.merge( "user_info" => {"name" => "othername"})
        User.create_with_omniauth(@attr)
      end.should change(User, :count).by(1)
    end
  end
  
  describe "items associations" do
    before(:each) do
      @user = User.create_with_omniauth(@attr)
      @it1 = Factory(:item, :user => @user, :expression => "one", :translation => "uno/una")
      @it2 = Factory(:item, :user => @user, :expression => "two", :translation => "dos")
    end
    
    it "should respond to items" do
      @user.should respond_to(:items)
    end
  end
  
end
