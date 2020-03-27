class Gym < ApplicationRecord
 has_many :users
 attachment :gym_image
 validates :gym_name, presence: true
 validates :description, presence: true

 #google API ------------------

  geocoded_by :address
  after_validation :geocode

#-------------------------------------------


end
