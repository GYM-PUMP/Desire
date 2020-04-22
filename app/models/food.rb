class Food < ApplicationRecord
	belongs_to :food_genre
	has_many :my_menus, dependent: :destroy
	attachment :food_image

	validates :food_name, presence: true
	validates :food_content, presence: true
end
