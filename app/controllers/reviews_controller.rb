class ReviewsController < ApplicationController

  before_action :set_proposal, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.proposal = @proposal
    if @review.save
      redirect_to proposal_path(@proposal)
    else
      render :new
    end
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:proposal_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
