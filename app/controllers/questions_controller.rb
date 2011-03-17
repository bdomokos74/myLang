class QuestionsController < ApplicationController
  before_filter :authenticate

  def index
    
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