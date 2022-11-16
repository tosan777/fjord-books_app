# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @followings = @user.followings
    @followers = @user.followers
  end

  # フォローワー一覧
  def follows
    user = User.find(params[:id])
    @users = user.followings.page(params[:page])
  end

  # フォロー一覧
  def followers
    user = User.find(params[:id])
    @users = user.followers.page(params[:page])
  end
end
