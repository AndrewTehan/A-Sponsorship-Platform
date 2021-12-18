class SponsorProposalController < ApplicationController
  def index; end

  def create
    @project = Project.find(params[:project_id])
    @sponsor_proposal = @project.sponsor_proposals.create(sponsor_proposal_params)
    @sponsor_condition = @project.sponsor_condition.create(sponsor_proposal_params)
    redirect_to project_path(@project)
  end

  private

    def sponsor_proposal_params
      params.require(:sponsor_proposal).permit()
    end
end
