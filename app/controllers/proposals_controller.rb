class ProposalsController < ApplicationController
  before_action :set_campaign, only: [:create]
  before_action :find_proposal, only: %i[show edit update]

  def index
    if current_user.role == 'Influencer'
      @influencer = current_user.influencer
      @proposals = @influencer.proposals
      @message = Message.new
    end
  end

  def choose_influencers
    @proposal = Proposal.where(title: params[:proposal][:proposals])[0]
    # @influencers = Influencer.find(params[:proposal][:influencer_ids])
    params[:proposal][:influencer_ids].split(",").each do |id|
      if @proposal.influencer.nil?
        @proposal.update(influencer_id: id)
      else
        @new_proposal = Proposal.new(title: @proposal.title, status: @proposal.status, campaign: @proposal.campaign, influencer_id: id, creator: @proposal.creator )
        @new_proposal.save!
      end
    end
    redirect_to campaign_path(@proposal.campaign)
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.campaign = @campaign
    @proposal.creator = current_user.role
    @proposal.influencer = current_user.influencer if current_user.role == "Influencer"
    if @proposal.save!
      @chatroom = Chatroom.create!(name: @proposal.title, proposal: @proposal)
      redirect_to current_user.role == "Business" ? influencers_path : proposals_path
    else
      @proposals = @campaign.proposals.where(creator: "Business")
      @incoming_proposals = @campaign.proposals.where(creator: "Influencer")
      render 'campaigns/show'
    end
  end

  def show; end

  def update
    @proposal.update(proposal_params)
    if current_user.role == "Business"
      redirect_to campaign_path(@proposal.campaign)
    else
      redirect_to proposals_path
    end
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def find_proposal
    @proposal = Proposal.find(params[:id])
  end

  def proposal_params
    params.require(:proposal).permit(:title, :status, :accepted)
  end
end
