class Users::GymsController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show]

  def index
    @gyms = Gym.all
    @hash = Gmaps4rails.build_markers(@gyms) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
    end
  end

end
