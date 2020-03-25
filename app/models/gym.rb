class Gym < ApplicationRecord
	has_many :users
	attachment :gym_image
	validates :title, presence: true
validates :body, presence: true
end
