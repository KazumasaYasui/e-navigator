class InterviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_interview, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :show, :update]

  def index
    @current_user_interviews = current_user.interviews.order(interview_datetime: :asc)
    @interviews = Interview.where(user_id: @user.id)
    @interviews_except_approval = @interviews.where.not(interview_status: "approval")
  end

  def show
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    @interview.user_id = current_user.id
    if @interview.save
      redirect_to user_interview_path(current_user, @interview), alert: '作成しました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.interviews.approval.update_all(interview_status: "refusal")
    if @interview.update(interview_params)
      if @user.interviews.approval.present?
        InterviewMailer.decide(@user, current_user).deliver
      end
      redirect_to user_interview_path(@user, @interview), alert: '更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @interview.destroy
    redirect_to user_interviews_path, alert: '削除しました。'
  end

  def apply
    interviewer = User.find(params[:interviewer_id])
    InterviewMailer.apply(interviewer, current_user).deliver
    redirect_to user_interviews_path, alert: '申請が完了しました！'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def interview_params
    params.require(:interview)
    .permit(:interview_datetime, :interview_status, :user_id)
  end
end
