class CampaignsController < ApplicationController
  before_action :set_business, only: %i[new create]
  before_action :find_campaign, only: %i[show edit update]

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.business = @business
    if @campaign.save
      redirect_to campaign_path(@campaign)
    else
      render :new
    end
  end

  def index
    if current_user.role == 'Business'
      @business = current_user.business
      @campaign = Campaign.new
      @campaigns = @business.campaigns
      @open_campaigns = @business.campaigns.where(archived: false)
      @closed_campaigns = @business.campaigns.where(archived: true)
    else
      @campaigns = Campaign.where(visibility: true, archived: false)
    end
  end

  def show
    @proposal = Proposal.new
    if current_user.role == 'Business'
      @proposals = @campaign.proposals.where(creator: "Business")
      @incoming_proposals = @campaign.proposals.where(creator: "Influencer")
    else

    end
  end

  def edit; end

  def update
    @campaign.update(campaign_params)
    redirect_to campaign_path(@campaign)
  end

  private

  def set_business
    @business = Business.find(params[:business_id])
  end

  def find_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:name, :location, :start_date, :end_date, :description, :budget)
  end
end
