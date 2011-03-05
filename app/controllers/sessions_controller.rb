class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) ||
        User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def dev_create
    redirect_to root_url unless RAILS_ENV == 'development'
    curr_user = User.find_by_name(params[:user][:name])
    if (curr_user)
      session[:user_id] = curr_user.id
      flash[:success] = "Signed in!"
      redirect_to root_url
    else
      flash[:error] = "Invalid user"
#      redirect_to root_url
      render 'show'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

  def debug

  end
end
