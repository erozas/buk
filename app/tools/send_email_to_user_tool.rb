class SendEmailToUserTool < ApplicationTool
  description "Send an email to a user"

  arguments do
    required(:id).filled(:integer).description("The id of the user to send the email to")
    required(:subject).filled(:string).description("The subject of the email")
    required(:body).filled(:string).description("The body of the email")
  end

  def call(id:, subject:, body:)
    user = User.find(id)  
    UserMailer.welcome_email(user.email, subject, body).deliver_later
  end
end