require 'spec_helper'

describe QuizzesController do
  render_views
  
  describe "signed in users" do
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user.id)
      @items = Array.new
      @items << Factory(:item1, :user => @user)
      @items << Factory(:item2, :user => @user)
      @items << Factory(:item3, :user => @user)
      @items << Factory(:item4, :user => @user)
      @items << Factory(:item5, :user => @user)
      @items << Factory(:item6, :user => @user)
      @items << Factory(:item7, :user => @user)
      @items << Factory(:item8, :user => @user)
      @items << Factory(:item9, :user => @user)
      @items << Factory(:item10, :user => @user)
    end
    
    describe "GET 'index'" do
      it "should be successful" do
        get 'index'
        response.should be_success
      end
      
      it "should have the right title" do
        get 'index'
        response.should have_selector("title", :content => "myLang | Quiz")
      end
    end
    
    describe "quizzes" do
      before(:each) do
        @answers = Hash.new
        @questions = Hash.new        
        i=0;
        @items.each { |item|                    
          @answers[i.to_s] = {:text => item.translation};
          @questions[i.to_s] = {:id => item.id};          
          i+=1
        }
        @answers["0"][:text] = "wrong"
      end
      
      it "should add to missed_words" do
        lambda do
          post :create, :answers => @answers, :questions => @questions
        end.should change(MissedWord, :count).by(1)
      end
      
      it "should add to missed_words" do        
        post :create, :answers => @answers, :questions => @questions
        missed = MissedWord.first
        missed.item.expression.should == "one"
        missed.count.should == 1
      end
      
      it "should increase count if exists" do
        m = @user.missed_words.build()
        m.item = @items[0]
        m.count = 1
        m.save!
        post :create, :answers => @answers, :questions => @questions                
        missed = MissedWord.first
        missed.item.expression.should == "one"
        missed.count.should == 2
      end      
    end
  end
end
