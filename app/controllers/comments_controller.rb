# frozen_string_literal: true

class CommentsController < ApplicationController

  def create
    if comment_params[:commentable_type].constantize.exists?(comment_params[:commentable_id])
      @commentable = comment_params[:commentable_type].constantize.find(comment_params[:commentable_id])
    else
      flash[:alert] = "この日報は存在しません。"
      return redirect_to users_path
    end
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントを投稿しました。"
      redirect_to @commentable
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :commentable_type, :commentable_id)
  end

end