class ProposalsController < ApplicationController
  before_action set_campaign, only: %i[new create]
  before_action find_proposal, only: %i[show edit update]

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.campaign = @campaign
    @proposal.user = current_user
    if @proposal.save
      redirect_to proposal_path(@proposal)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @proposal.update(proposal_params)
    redirect_to proposal_path(@proposal)
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def find_proposal
    @proposal = Proposal.find(params[:id])
  end

  def proposal_params
    params.require(:proposal).permit(:influencer)
  end
end
