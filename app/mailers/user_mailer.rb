class UserMailer < ApplicationMailer
  default from: 'hello@musicapp.com'

  def auth_email(user)
    @user = user
    @url = "localhost:3000/users/activate?activation_token=#{user.activation_token}"
    mail(to: user.email, subject: 'Authenticate you Music App Account')
  end

end
