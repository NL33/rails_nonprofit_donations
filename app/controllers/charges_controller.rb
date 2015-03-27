class ChargesController < ApplicationController
 def new
 end

 def create
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here https://dashboard.stripe.com/account/apikeys
    #Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    @entered_amount = params[:amount]
    no_commas = @entered_amount.gsub(/,/,'').to_i 
    amount = (no_commas * 100)

    # Create the charge on Stripe's servers - this will charge the user's card
   if amount > 0
    begin
      charge = Stripe::Charge.create(
        :amount => amount, # amount in cents, again
        :currency => "usd",
        :source => token,
        :description => params[:email]
      )
    rescue Stripe::CardError => e
    end
  else 
    flash[:notice] = "You entered an invalid amount. Please try again" #flash not showing up for some reason
    redirect_to root_path
  end
 end

end
