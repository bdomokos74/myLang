class AnswersController < ApplicationController
  before_filter :authenticate

  def index
  end

  def create
  end

  def show
    @answer = Answer.find(params[:id])
  end
    
  def update
  end

  def destroy
  end

end