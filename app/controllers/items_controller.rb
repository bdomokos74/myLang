class ItemsController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy
  
  def index
    authenticate
    return unless signed_in?
    @title = "Words"
    @user = current_user
    if !params[:tag] || params[:tag]=='All'
      @items = Item.all.paginate(:page => params[:page], :per_page => 10)
    elsif
      @items = Item.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 10)
    end
    @item = @user.items.build()
    @tags = Item.tag_counts_on(:tags)
  end
  
  def create
    @item = current_user.items.build(params[:item])
    @item.tag_list = params[:item][:tag_list]
    session[:last_tag] = @item.tag_list
    if @item.save
      flash[:success] = "Item created."
      redirect_to items_path
    else
      redirect_to root_path
    end
  end
  
  def destroy
    @item.destroy
    flash[:success] = "Item deleted."
    redirect_to items_path    
  end

  private
  
  def authorized_user
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user?(@item.user)
  end
end
