class UserNotifier < ApplicationMailer
  default :from => 'harshil.goel@students.iiit.ac.in'

  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end

end
