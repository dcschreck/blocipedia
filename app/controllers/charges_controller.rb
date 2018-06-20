class ChargesController < ApplicationController

  def new
      # @user = current_user
      # @stripe_btn_data = {
      #     key: "#{ Rails.configuration.stripe[:publishable_key] }",
      #     description: "Premium Membership - #{current_user.email}",
      #     amount: 15_00
      # }
  end

  def create
      # @user = current_user
      customer = Stripe::Customer.create(
          email: current_user.email,
          card: params[:stripeToken]
      )

      charge = Stripe::Charge.create(
          customer: customer.id,
          amount: 15_00,
          description: "Premium Membership - #{current_user.email}",
          currency: 'usd'
      )

      current_user.premium!
      flash[:notice] = "Thank you for your business, #{current_user.email}! Enjoy Blocipedia!"
      redirect_to wikis_path

  end
end
