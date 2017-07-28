class UsersController < ApplicationController
  before_action :ensure_logged_in, except: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    # debugger
    @user = User.new(user_params)
      if @user.save
        login(@user)
        redirect_to bands_url
      else
        flash.now[:errors] = @user.errors.full_messages
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
