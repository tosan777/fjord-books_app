class UsersController < ApplicationController
  def index
    @user = User.where.not(id: current_user.id).order(:remember_created_at, :id).page(params[:page]).per(3)
  end

  def show
    @user = User.find(params[:id])
  end
end
