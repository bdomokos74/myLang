class QuizzesController < ApplicationController
  before_filter :authenticate

  def index
    @quizzes = Quiz.all
  end

  def create
  end

  def show
    @quiz = Quiz.find(params[:id])
  end
    
  def update
  end

    def destroy
  end

end