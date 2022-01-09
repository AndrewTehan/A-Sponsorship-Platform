class SponsorProposalsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    authorize @project
    SponsorProposal.create(project_id: @project.id, **sponsor_proposal_params)

    redirect_to project_path(@project)
  end

  def reject
    @project = Project.find(params[:project_id])
    sponsor_proposal.update!(status: 'rejected') 
    redirect_to project_path(@project)
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 
  private

  def sponsor_proposal
    SponsorProposal.find(params[:sponsor_proposal_id])  
  end
 
  def user_not_authorized
    redirect_to(request.referrer || rootpath)
  end

  def sponsor_proposal_params
    params.require(:sponsor_proposal).permit(:user_id, sponsor_conditions_attributes: %i[value requirements_phrase_id])
  end
end
