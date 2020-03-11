class Genre < ApplicationRecord
	has_many :supplements
	attachment :genre_image
	validates :genre_name, presence: true
end
