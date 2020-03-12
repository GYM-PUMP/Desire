class Gym < ApplicationRecord
	has_many :users
	has_many :comments
	attachment :gym_image
end
