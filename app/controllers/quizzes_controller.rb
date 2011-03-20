class QuizzesController < ApplicationController  
  before_filter :authenticate
  
  def index
    if( params[:start] == 'yes')
      @title = "Quiz"
      user = current_user
      @quiz = user.quizzes.build()
      items = Item.all.shuffle
      1.upto(10) { |n| @quiz.questions.build(:item_id => items[n].id) }
      render '_quiz_form'
    else
      @quizzes = Quiz.all
    end
  end  

  def create
    @title = "Result"    
    @quiz = current_user.quizzes.create!()
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
    @quiz.score = calc_score()
    @quiz.status = 'completed'
    @quiz.save
  end
  
  def show
    @quiz = Quiz.find(params[:id])
    calc_results()      
  end

    def destroy
  end
  
  private
  
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