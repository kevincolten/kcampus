class UserMailer < ActionMailer::Base
  default from: "kevin@kcamp.us"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

end
