class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user

    mail(
      to: @user.email,
      subject: 'Welcome to Lalagence!'
      )
  end

  def folder(candidature)
    @candidature = candidature
    @user = @candidature.user
    @flat = @candidature.url_flat.flat

    mail(
      to: @candidature.mail_agency,
      subject: 'Nouveau dossier de location'
      )
  end

end
