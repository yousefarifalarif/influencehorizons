# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # after_action :after_sign_up_path_for, only: [:create]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    puts 'creating user'
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   attributes = [:phone_number, :first_name, :last_name, :location, :role]
  #   devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  # end

  # # # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   attributes = [:phone_number, :first_name, :last_name, :location, :role]
  #   devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    p "registrations"
    if resource.save!
      if resource.role == "Influencer"
        new_user_influencer_path(resource)
      elsif resource.role == "Business"
        new_user_business_path(resource)
      end
    else
      render :new
    end
  end

  def after_update_path_for(resource)
    user_path(current_user)
  end

  # def after_inactive_sign_up_path_for(resource)
  #   if resource.role == "Influencer"
  #     new_user_influencer_path(resource)
  #   elsif resource.role == "Business"
  #     new_user_business_path(resource)
  #   end
  # end
end
