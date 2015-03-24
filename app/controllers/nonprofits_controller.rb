class NonprofitsController < ApplicationController
  #before_filter :authenticate_user!, except: [:index, :show]  #devise method: without being logged in, can only see the index and show
 
  def index 
    @nonprofits = Nonprofit.all
  end

  def new 
    @nonprofit = Nonprofit.new
  end

  def create
    @nonprofits = Nonprofit.all
    @nonprofit = Nonprofit.new(nonprofit_params)
    if @nonprofit.save
       flash[:notice] = "Nonprofit added"
       redirect_to root_path
    else
        render 'new' 
      end
  end

  def show
    @nonprofit = Nonprofit.find(params[:id]) 
  end

 private

    def nonprofit_params
      params.require(:nonprofit).permit(:name, :description)
    end

end