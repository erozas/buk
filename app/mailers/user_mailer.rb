class UserMailer < ApplicationMailer
  def welcome_email(email, subject, body)
    @email = email
    @subject = subject
    @body = body

    mail(to: email, subject: subject)
  end
end