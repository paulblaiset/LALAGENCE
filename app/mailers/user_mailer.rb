class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user

    mail(
      to: @user.email,
      subject: 'Welcome to Lalagence!'
      )
  end

  def folder(user)
    @user = user

    mail(
      to: @user.email,
      subject: 'Nouveau dosser de location :'
      )
  end

end
