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
      subject: 'Nouveau Dosser de location :'
      )
  end

end
