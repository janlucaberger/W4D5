class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # debugger
    @user = User.new(user_params)
      if @user.save
        login(@user)
        redirect_to user_url(@user)
      else
        flash.now[:errors] = ["Looks like that use already exists"]
        render :new
      end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def destroy
  end

  def update
  end


  private

  def user_params
    params.require(:user).permit([:email, :password])
  end
end
