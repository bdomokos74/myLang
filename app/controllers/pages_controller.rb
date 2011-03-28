class PagesController < ApplicationController  
  
  def home
    @title = "Home"
    if signed_in?    
      @user = current_user
      @tag_array = sorted_tag_array
      @missed = missed_words_array
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
end
