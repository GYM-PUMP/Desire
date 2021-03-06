class Admins::GymsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @gyms = Gym.all
    @hash = Gmaps4rails.build_markers(@gyms) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
    end
  end

  def new
    @gym = Gym.new
  end

  def create
    @gym = Gym.new(gym_params)
    if @gym.save
      redirect_to admins_gyms_path
    else
      render 'new'
    end
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    @gym = Gym.find(params[:id])
    if @gym.update(gym_params)
      redirect_to admins_gyms_path
    else
      render "edit"
    end
  end

  def destroy
      @gym = Gym.find(params[:id])
      @gym.destroy
      redirect_to admins_gyms_path, notice: "successfully delete gym!"
  end

  private

  def gym_params
      params.require(:gym).permit(:gym_name, :description, :gym_image, :postal_code, :address, :gym_url)
  end

end
