class ItemsController < ApplicationController
  before_filter :authenticate

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
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "Item deleted."
    redirect_to words_path    
  end
  
end
