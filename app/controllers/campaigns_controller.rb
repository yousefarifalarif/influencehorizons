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
    case current_user.role
    when 'Business'
      # Get campaigns for business
      @campaign = Campaign.new
      @business = current_user.business
      if params[:query].present?
        @campaigns = @business.campaigns.where("name ILIKE ?", "%#{params[:query]}%")
      else
        @campaigns = @business.campaigns
      end
    when 'Influencer'
      # Get campaigns for influencers
      if params[:query].present?
        sql_query = "name ILIKE :query OR businesses.company_name ILIKE :query"
        @campaigns = Campaign.joins(:business)
                             .where(visibility: true, archived: false)
                             .where(sql_query, query: "%#{params[:query]}%")
      else
        @campaigns = Campaign.where(visibility: true, archived: false)
      end
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'campaigns/list_campaign', locals: { campaigns: @campaigns }, formats: [:html] }
    end
  end

  def show
    @proposal = Proposal.new
    if current_user.role == 'Business'
      @proposals = @campaign.proposals.where(creator: "Business")
      @incoming_proposals = @campaign.proposals.where(creator: "Influencer")
    else

    end
    @message = Message.new
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
