class UserMailer < ApplicationMailer
  default from: 'zenmind.app.test@gmail.com'
  def send_password_reset(user)
    @user = user
    @raw = user.send(:set_reset_password_token)
    mail(:to => @user.email, :subject => "Reset password instructions")
  end
end
