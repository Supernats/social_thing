class PasswordResetsController < ApplicationController

  def new
    render :new
  end

  def create
    @reset_token = SecureRandom::urlsafe_base64(16)
    @user = User.find_by_email(params[:user][:email])
    @user.reset_token = @reset_token
    @user.save!
    msg = PasswordResetMailer.reset_email(@user, @reset_token).deliver!
    redirect_to new_session_url
  end

  def edit
    @user = User.find_by_reset_token(params[:reset_token])
    p @user
    render :edit
  end

  def update
    @user = User.find(params[:user][:id])
    p @user
    @user.password=(params[:user][:password])
    if @user.save
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

end