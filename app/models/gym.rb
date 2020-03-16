class Gym < ApplicationRecord
	has_many :users
	attachment :gym_image
end
