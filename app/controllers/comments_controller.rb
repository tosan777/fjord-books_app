# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :comment_params, only: %i[create update]
  before_action :set_comment, only: %i[edit update destroy]

  def edit
    @commentable = @comment.commentable
  end

  def create
    # モデルの存在確認をする。
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'コメントを投稿しました。'
      redirect_to @comment.commentable
    else
      flash[:alert] = 'この投稿は削除されました。'
      redirect_to controller: "#{comment_params[:commentable_type].downcase}".pluralize.to_sym, action: :index
    end
  end

  def update
    if @comment.user_id == current_user.id
      @comment.update(comment_params)
      flash[:success] = 'コメントの編集に成功しました。'
      redirect_to @comment.commentable
    else
      render :edit
    end
  end

  def destroy
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to @comment.commentable
    else
      redirect_to @comment.commentable
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :commentable_type, :commentable_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
