require 'spec_helper'

describe Answer do
  it "should have a text attribute" do
    answer = Answer.new()
    answer.should respond_to(:text)
  end
end
