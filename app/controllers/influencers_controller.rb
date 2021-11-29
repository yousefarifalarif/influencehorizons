require_relative '../apis/api_index'

class InfluencersController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :find_influencer, only: %i[show edit update]

  def index
    @influencers = Influencer.all
  end

  def new
    @influencer = Influencer.new
  end

  def create
    @influencer = Influencer.new(influencer_params)
    @influencer.user = @user
    @influencer.twitter_followers = twitter_api(influencer_params[:twitter_username])["data"]["public_metrics"]["followers_count"].to_i
    raise
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
                                       :twitter_username, :facebook_username, :facebook_followers,
                                       :profile_pic, :gender)
  end
end
