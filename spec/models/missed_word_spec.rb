require 'spec_helper'

describe MissedWord do
  before(:each) do
    @user = Factory(:user)
    @item = Factory(:item1, :user => @user)
    @attr = {:item_id => @item.id, :count => 3}
  end
  
  describe "attributes" do
    before(:each) do
      @missed = @user.missed_words.create!(@attr)
    end
    
    it "should have an item attr" do
      @missed.should respond_to(:item)
    end

    it "should have a user attr" do
      @missed.should respond_to(:user)
    end

    it "should have a count attr" do
      @missed.should respond_to(:count)
    end

  end
end
