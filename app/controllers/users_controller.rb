class UsersController < ApplicationController
  def index
    @user = User.where.not(id: current_user.id).order(:remember_created_at, :id)
  end

  def show
    @user = User.find(params[:id])
  end
end
