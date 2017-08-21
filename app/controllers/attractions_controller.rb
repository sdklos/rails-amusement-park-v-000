class AttractionsController < ApplicationController
  helper_method :current_user

  def index
    @attractions = Attraction.all
    @current_user = User.find(session[:user_id])
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def new
    @current_user = User.find(session[:user_id])
    unless @current_user.admin
      redirect_to attractions_path
    end
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    end
  end

  def edit
    @current_user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
  end


  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
