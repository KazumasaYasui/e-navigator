class InterviewMailer < ApplicationMailer

  def apply(interviewer, interviewee)
    @interviewer = interviewer
    @interviewee = interviewee
    @url = user_interviews_url(@interviewee)
    mail to:      interviewer.email,
         subject: '面接希望日が決まりました'
  end

  def decide(interviewee, interviewer)
    @interviewee = interviewee
    @interviewer = interviewer
    @decided_datetime = @interviewee.interviews.find_by(interview_status: "approval").interview_datetime
    users = [interviewee, interviewer]
    mail to:      users.map{|u| u.email},
         subject: '面接日時が確定しました'
  end
end
