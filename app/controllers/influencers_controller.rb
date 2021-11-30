class InfluencersController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :find_influencer, only: %i[show edit update]

  def index
    @influencers = Influencer.all
    # fetch proposals without influencer
    @proposals = Proposal.joins(:campaign).where(creator: "Business", campaign: { business: current_user.business, archived: false }).distinct.pluck(:title)
  end

  def new
    @influencer = Influencer.new
  end

  def create
    @influencer = Influencer.new(influencer_params)
    @influencer.user = @user
    if @influencer.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @influencer.update(influencer_params)
    redirect_to influencer_path(@influencer)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def find_influencer
    @influencer = Influencer.find(params[:id])
  end


  def influencer_params
    params.require(:influencer).permit(:ig_username, :ig_follwers, :youtube_channel_name, :youtube_subscribers,
                                       :twitter_username, :twitter_followers, :facebook_username, :facebook_followers,
                                       :profile_pic, :gender)
  end

end
