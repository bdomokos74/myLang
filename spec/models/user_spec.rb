require 'spec_helper'

describe User do

  before(:each) do
    @attr = {"provider" => "testprovider", "uid" => "testuid", "user_info" => { "name" => "testname"}}
  end

  describe "create_with_omniauth" do
    it "should create a new user" do
      lambda do
        User.create_with_omniauth(@attr)
      end.should change(User, :count).by(1)
    end
  end
end
