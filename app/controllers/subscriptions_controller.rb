class SubscriptionsController < ApplicationController

  def new
  end

  def create
  end

  def show
    @subscription = Subscription.find(params[:id])
  end
end