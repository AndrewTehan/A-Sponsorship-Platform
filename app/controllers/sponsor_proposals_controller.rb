class SponsorProposalsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    SponsorProposal.create(project_id: @project.id, **sponsor_proposal_params)

    redirect_to project_path(@project)
  end

  private

  def sponsor_proposal_params
    params.require(:sponsor_proposal).permit(:user_id, sponsor_conditions_attributes: %i[value requirements_phrase_id])
  end
end
