require_relative '../apis/api_index'

class InfluencersController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :find_influencer, only: %i[show edit update]

  def index
    if params[:query].present?
      sql_query = "gender ILIKE :gender OR users.first_name ILIKE :query OR users.last_name ILIKE :query OR users.locationILIKE :query"
      @influencers = Influencer.joins(:user)
                               .where(sql_query, gender: "#{params[:query]}%", query: "%#{params[:query]}%")
    else
      @influencers = Influencer.all
    end
    # fetch proposals without influencer
    @proposals = Proposal.joins(:campaign).where(creator: "Business", campaign: { business: current_user.business, archived: false }).distinct.pluck(:title)

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'influencers/list_influencers', locals: { influencers: @influencers }, formats: [:html] }
    end
  end

  def new
    @influencer = Influencer.new
  end

  def create
    @influencer = Influencer.new(influencer_params)
    @influencer.user = @user
    # @influencer.twitter_followers = TwitterApi.new.twitter_api(influencer_params[:twitter_username])
    # @influencer.ig_followers = InstagramApi.new.instagram_api(influencer_params[:ig_username])
    # @influencer.youtube_subscribers = YoutubeApi.new.youtube_api(influencer_params[:youtube_channel_name])
    # @influencer.facebook_followers = FacebookApi.new.facebook_api(influencer_params[:facebook_username])
    if @influencer.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @influencer.update!(influencer_params)
    redirect_to user_path(@influencer)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def find_influencer
    @influencer = Influencer.find(params[:id])
  end

  def influencer_params
    params.require(:influencer).permit(:ig_username, :ig_followers, :youtube_channel_name, :youtube_subscribers,
                                       :twitter_username, :facebook_username, :facebook_followers,
                                       :profile_pic, :gender)
  end
end
