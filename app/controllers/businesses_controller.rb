class BusinessesController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :find_business, only: %i[show edit update]

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    @business.user = @user
    if @business.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @business.update(business_params)
    redirect_to business_path(@business)
  end


  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def find_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:company_name, :logo)
  end
end
