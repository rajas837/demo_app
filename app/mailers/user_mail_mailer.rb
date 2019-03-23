class UserMailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the  following lookup:
  #
  #   en.user_mail_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    #attachments["admin.jpeg"] = File.read("/Users/rajasekar/Desktop/admin.jpeg")
    mail(to: user.email, from:"xyz@gmail.com", subject: "Welcome Mr #{user.name} to online shopping world.")
  end
end  
