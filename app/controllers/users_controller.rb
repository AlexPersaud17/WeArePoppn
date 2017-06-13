class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = current_user if logged_in?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
      UserMailer.welcome_email(@user).deliver_now
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
