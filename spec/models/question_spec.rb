require 'spec_helper'

describe Question do
  it "should have an item attribute" do
    question = Question.new()
    question.should respond_to(:item)
  end
  
end
