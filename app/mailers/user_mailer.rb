class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user

    mail(
      to: @user.email,
      subject: 'Welcome to Lalagence!'
      )
  end

  def folder(candidature)
    @user = candidature.user
    @candidature = candidature

    mail(
      to: @candidature.email,
      subject: 'Nouveau dosser de location :'
      )
  end

end
