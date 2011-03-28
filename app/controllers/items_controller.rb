class ItemsController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy
  
  def index    
    @title = "Words"
    @user = current_user
    if !params[:tag] || params[:tag]=='All'
      @items = Item.all.paginate(:page => params[:page], :per_page => 10)
    elsif
      @items = Item.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 10)
    end
    @item = @user.items.build()
    @tag_array = sorted_tag_array
    @missed = missed_words_array
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
  
  def update
    @item = Item.find(params[:id])
    @item.expression = params[:item][:expression]
    @item.translation = params[:item][:translation]
    @item.tag_list = params[:item][:tag_list]
    @item.save!
    print "item #{@item.id} saved"
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def show
    @user = current_user
    @item = Item.find(params[:id])
    @tag_array = sorted_tag_array
    @missed = missed_words_array
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
