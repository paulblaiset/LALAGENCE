# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    user = User.first
    UserMailer.welcome(user).deliver_now
  end

  def folder
    user = User.first
    UserMailer.folder(user).deliver_now
  end
end


