class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    # debugger
    if user
      login(user)
      redirect_to bands_url
    else
      flash.now[:errors] = ["Looks like your creds dont work :("]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end


end
