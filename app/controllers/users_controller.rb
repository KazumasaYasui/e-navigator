class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :correct_user]
  before_action :correct_user, only: [:edit, :update]
  def index
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path, alert: '更新しました。'
    else
    render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user)
    .permit(:email, :name, :birth, :sex, :school_name)
  end

  def correct_user
    if current_user.id != @user.id
      redirect_to root_path
    end
  end
end
