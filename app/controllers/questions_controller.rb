class QuestionsController < ApplicationController
  before_filter :authenticate

  def index
    @questions = Quiz.find(params[:quiz_id]).questions
  end

  def create
  end

  def show
    @question = Question.find(params[:id])
    @item = Item.find(@question.item_id)
  end
    
  def update
  end

  def destroy
  end

end