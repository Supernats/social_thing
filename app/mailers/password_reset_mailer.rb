class PasswordResetMailer < ActionMailer::Base
  include ApplicationHelper
  default from: "from@example.com"

  def reset_email(user, reset_token)
    @user = user
    @reset_token = reset_token
    @url = create_password_reset_url(@reset_token)
    mail(to: user.email, subject: 'Reset your email')
  end
end
