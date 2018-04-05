class InterviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user, only: [:new, :create, :edit, :update]
  before_action :set_interview, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def index
    @interviews = Interview.all.order(created_at: :desc)
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
      redirect_to user_interview_path(@user, @interview), alert: '作成しました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @interview.update(interview_params)
      redirect_to user_interview_path(@user, @interview), alert: '更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @interview.destroy
    redirect_to user_interviews_path, alert: '削除しました。'
  end

  private

  def set_current_user
    @user = User.find(current_user.id)
  end

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def interview_params
    params.require(:interview)
    .permit(:interview_datetime, :is_available, :user_id)
  end

  def correct_user
    if current_user.id != @interview.user_id
      redirect_to root_path
    end
  end
end
