class AttractionsController < ApplicationController
  before_action :find_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
    find_attraction
  end

  def show
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.valid?
      @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end



  private
  def find_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
