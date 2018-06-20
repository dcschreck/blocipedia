# frozen_string_literal: true

class Registrations::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  #
  #   @stripe_btn_data = {
  #       key: "#{ Rails.configuration.stripe[:publishable_key] }",
  #       description: "Premium Membership - #{current_user.email}",
  #       amount: 15_00
  #   }
  # end

  # POST /resource
  # def create
  #   super
  #
  #   customer = Stripe::Customer.create(
  #       email: current_user.email,
  #       card: params[:stripeToken]
  #   )
  #
  #   charge = Stripe::Charge.create(
  #       customer: customer.id,
  #       amount: 15_00,
  #       description: "Premium Membership - #{current_user.email}",
  #       currency: 'usd'
  #   )
  #
  #   current_user.premium!
  #   flash[:notice] = "Thank you for your business, #{current_user.email}! Enjoy Blocipedia!"
  #   redirect_to wikis_path
  # end

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
