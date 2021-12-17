class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.create(comment_params)
    binding.pry
    redirect_to project_path(@project)
  end

  private

    def comment_params
      params.require(:comment).permit(:text, :user_id)
    end
end
