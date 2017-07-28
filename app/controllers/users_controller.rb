class UsersController < ApplicationController
  before_action :ensure_logged_in, except: [:new, :create, :activate]

  def new
    @user = User.new
    render :new
  end

  def create
    # debugger
    @user = User.new(user_params)
      if @user.save
        login(@user)
        email = UserMailer.auth_email(@user)
        email.deliver_now
        redirect_to bands_url
      else
        flash.now[:errors] = @user.errors.full_messages
        render :new
      end
  end

  def activate
    @user = User.find_by(activation_token: params[:activation_token])
    if @user
      @user.toggle(:authenticated)
      debugger
      redirect_to bands_url
    else
      render plain: "Error"
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
