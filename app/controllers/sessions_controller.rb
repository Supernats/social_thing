class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user.is_password?(params[:user][:password])
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Invalid name or password"]
      render :new
    end
  end

  def destroy
    @user = current_user
    logout_user!(@user)
    redirect_to new_session_url
  end

end