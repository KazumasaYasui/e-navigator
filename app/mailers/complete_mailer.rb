class CompleteMailer < ApplicationMailer

  default from: ENV['E_MAIL']
  def send_when_complete(user, current_user)
    @user = user
    @interviewer = current_user
    @complete_datetime = @user.interviews.find_by(interview_status: "approval").interview_datetime
    users = [user, current_user]
    mail to:      users.map{|u| u.email},
         subject: '面接日時が確定しました'
  end
end
