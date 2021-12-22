class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_back fallback_location: root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :commentable_id, :commentable_type)
  end
end
