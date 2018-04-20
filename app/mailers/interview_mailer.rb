class InterviewMailer < ApplicationMailer

  default from: ENV['E_MAIL']
  def apply(interviewer, current_user)
    @interviewer = interviewer
    @user = current_user
    @url = user_interviews_url(@user)
    mail to:      interviewer.email,
         subject: '面接希望日が決まりました'
  end

  def decide(user, current_user)
    @user = user
    @interviewer = current_user
    @complete_datetime = @user.interviews.find_by(interview_status: "approval").interview_datetime
    users = [user, current_user]
    mail to:      users.map{|u| u.email},
         subject: '面接日時が確定しました'
  end
end
