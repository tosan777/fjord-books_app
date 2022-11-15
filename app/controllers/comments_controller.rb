# frozen_string_literal: true

class CommentsController < ApplicationController

  def create
    @commentable = comment_params[:commentable_type].constantize.find(comment_params[:commentable_id])
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントを投稿しました。"
      redirect_to @commentable
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :commentable_type, :commentable_id)
  end

  def set_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

end