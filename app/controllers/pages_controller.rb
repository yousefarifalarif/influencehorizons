class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    if current_user.business
      @sum_eng_rate = 0
      @campaigns = current_user.business.campaigns

      @campaigns.each do |campaign|
        campaign.proposals.each do |proposal|
          @sum_eng_rate += proposal.influencer.ig_followers if proposal.accepted
        end
      end
    elsif current_user.influencer
      @proposals = current_user.influencer.proposals
    end
  end
end
