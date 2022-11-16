# frozen_string_literal: true

class FollowRelationshipsController < ApplicationController
  before_action :other_user

  # フォローするとき
  def create
    current_user.follow(params[:user_id])
    redirect_to @other_user
  end

  # フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to @other_user
  end

  private

  def other_user
    @other_user = User.find(params[:user_id])
  end
end
