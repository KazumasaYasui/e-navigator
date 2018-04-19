class RequestMailer < ApplicationMailer

  default from: "test.mail.sample321@gmail.com"
  def send_when_request(interviewer, current_user)
    @interviewer = interviewer
    @user = current_user
    @url = user_interviews_url(@user)
    mail to:      interviewer.email,
         subject: '面接希望日が決まりました'
  end
end
