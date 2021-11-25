class ProposalsController < ApplicationController
  before_action :set_campaign, only: [:create]
  before_action :find_proposal, only: %i[show edit update]

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.campaign = @campaign
    @proposal.creator = current_user.role
    if @proposal.save
      redirect_to influencers_path
    else
      @proposals = @campaign.proposals.where(creator: "Business")
      @incoming_proposals = @campaign.proposals.where(creator: "Influencer")
      render 'campaigns/show'
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
    params.require(:proposal).permit(:title)
  end
end
