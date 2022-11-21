# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show follows followers]

  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @followings = @user.followings
    @followers = @user.followers
  end

  # フォローワー一覧
  def follows
    @users = user.followings.page(params[:page])
  end

  # フォロー一覧
  def followers
    @users = user.followers.page(params[:page])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
