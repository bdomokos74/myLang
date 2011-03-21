class ItemsController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy
  
  def create
    @item = current_user.items.build(params[:item])    
    if @item.save
      flash[:success] = "Item created."
      redirect_to words_path
    else
      redirect_to root_path
    end
  end
  
  def destroy
    @item.destroy
    flash[:success] = "Item deleted."
    redirect_to words_path    
  end
  
  private
  
  def authorized_user
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user?(@item.user)
  end
end
