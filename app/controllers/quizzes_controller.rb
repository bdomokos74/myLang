class QuizzesController < ApplicationController  
  before_filter :authenticate
  
  def index
    @title = "Quiz"
    if( params[:start] == 'yes')      
      @user = current_user
      @quiz = @user.quizzes.build()      
      if(!params[:tag]||params[:tag]=='All')
        items = Item.all
        @current_tag = 'All'
      elsif(!params[:tag]||params[:tag]=='Missed')
        missed = MissedWord.where(:user_id => @user.id).limit(50).order("count DESC").all
        items = missed.collect { |m| m.item }
        @current_tag = 'Missed'
      else
        items = Item.tagged_with(params[:tag])
        @current_tag = params[:tag]
      end
      items.shuffle!
      0.upto([9, items.length-1].min) { |n| 
        print("n=#{n}, item[n].id=#{items[n].id}\n")
        @quiz.questions.build(:item_id => items[n].id) 
       }
      @tag_array = sorted_tag_array
      render '_quiz_form'
    else
      @user = current_user
      @quizzes = @user.quizzes.where(:status => "completed")
    end
  end  

  def create
    @title = "Result"  
    @user = current_user
    @quiz = @user.quizzes.create!()
    answers = params[:answers]
    score = 0
    0.upto(9) { |i|
      value = answers[i.to_s][:text]
      @quiz.answers.create(:text => value)
    }
    
    questions = params[:questions]
    0.upto(9) { |i|
      value=questions[i.to_s][:id] 
      @quiz.questions.create(:item_id => value )
    }
    
    calc_results()
    add_missed()
    @quiz.score = calc_score()
    @quiz.status = 'completed'
    @quiz.save
    @tag_array = sorted_tag_array
    @missed = missed_words_array
  end
  
  def show
    @quiz = Quiz.find(params[:id])
    @user = current_user
    calc_results()
    @tag_array = sorted_tag_array
    @missed = missed_words_array
  end

    def destroy
  end
  
  private
  
  def add_missed    
    @quiz.answers.each_index do |i|      
      if !correct?(i)
        missed = MissedWord.where(:user_id =>  @user.id, :item_id => @quiz.questions[i].item.id).first
        if missed.nil?
          missed = @user.missed_words.create!()
          missed.item = @quiz.questions[i].item
          missed.count = 0
        end                
        missed.count +=1
        missed.save!
      end
    end
  end
  
  def calc_results
    @result = []
    @quiz.answers.each_index do |i|      
      if correct?(i)
        @result[i] = 'good'        
      elsif
        @result[i] = 'bad'
      end
    end    
  end
  
  def calc_score
    score = 0
    @quiz.answers.each_index do |i|      
      if correct?(i)
        score+=1
      end
    end
    score
  end
  
  def correct?(i) 
    if( @quiz.questions[i].item.translation.strip == @quiz.answers[i][:text].strip)
      true
    elsif
      false
    end
  end

end