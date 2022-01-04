module ProjectHelper
  def sponsor_proposals
    @project.sponsor_proposals.where({status: 0})
  end
end