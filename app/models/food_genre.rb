class FoodGenre < ApplicationRecord
	has_many :foods
	attachment :food_genre_image
	validates :food_genre_name, presence: true
end
