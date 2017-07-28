class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      login(user)
      redirect_to users_url
    else
      flash.now[:errors] = "Looks like your creds dont work :("
      render :new
    end
  end

  def destroy
  end


end
