# frozen_string_literal: true

class CommentsController < ApplicationController

  def create
    if comment_params[:commentable_type].constantize.exists?(comment_params[:commentable_id])
      @comment = Comment.new(comment_params)
      @comment.user_id = current_user.id
      @comment.save
      flash[:success] = "コメントを投稿しました。"
      redirect_to @comment.commentable
    else
      flash[:alert] = "この日報は存在しません。"
      return redirect_to users_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to @comment.commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :commentable_type, :commentable_id)
  end

end