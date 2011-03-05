class PagesController < ApplicationController
  def home
    @title = "Home"
    @user = User.new
  end

  def dashboard
    @title = "Dashboard"
  end

  def words
    @title = "Words"
  end
  
  def quiz
    @title = "Quiz"
  end
  
  def settings
    @title = "Settings"
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
end
