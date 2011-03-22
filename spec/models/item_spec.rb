# encoding: utf-8
require 'spec_helper'

describe Item do
  before(:each) do
    @user = Factory(:user)
    @attr = { :expression => "tomorrow", :translation => "mañana"}
  end
  
  it "should create a new item given valid attributes" do
    @user.items.create!(@attr)
  end
  
  describe "user associations" do
    before(:each) do
      @item = @user.items.create!(@attr)
    end
    
    it "should have a user attribute" do
      @item.should respond_to(:user)
    end
    
    it "should have the right associated user" do
      @item.user.should == @user
    end
  end
  
  describe "validations" do
    it "should require a user id" do
      Item.new(@attr).should_not be_valid
    end
    
    it "should require a non-empty expression" do
      item = @user.items.build(:expression => "      ", :translation => "test")
      item.should_not be_valid
    end

    it "should require a non-empty translation" do
      item = @user.items.build(:expression => "test", :translation => "      ")
      item.should_not be_valid
    end

    it "should be valid given nonempty attrs" do
      item = @user.items.create(@attr)
      item.should be_valid
    end    
  end
  
  describe "tags" do
    it "should have a tag_list attribute" do
      item = @user.items.create(@attr)
      item.should respond_to(:tag_list)
    end
  end
  
end
