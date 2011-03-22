class PagesController < ApplicationController  
  
  def home
    @title = "Home"
    @user = User.new
  end

  def dashboard
    authenticate
    return unless signed_in?
    @title = "Dashboard"
    @user = current_user
    @quizzes = @user.quizzes.where(:status => "completed")
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
end
