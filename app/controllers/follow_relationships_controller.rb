# frozen_string_literal: true

class FollowRelationshipsController < ApplicationController
  # フォローするとき
  def create
    if (@other_user = User.find_by(id: params[:user_id]))
      current_user.follow(@other_user)
      redirect_to @other_user
    else
      flash[:alert] = 'このユーザーは存在しません。'
      redirect_to users_path
    end
  end

  # フォロー外すとき
  def destroy
    if (@other_user = User.find_by(id: params[:user_id]))
      current_user.unfollow(@other_user)
      redirect_to @other_user
    else
      flash[:alert] = 'このユーザーは存在しません。'
      redirect_to users_path
    end
  end
end
