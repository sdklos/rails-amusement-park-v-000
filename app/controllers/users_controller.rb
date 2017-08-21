class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user)
      session[:user_id] = @user.id
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @message = params[:message] if params[:message]
    if @user.id != session[:user_id]
      redirect_to '/'
    end
  end

  def update
    @ride = Ride.create(user_id: params[:id], attraction_id: params[:user][:attraction_id])
    @message = @ride.take_ride
      redirect_to user_path(@ride.user, :message => @message)
  end



  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin, :attraction_id)
  end
end
