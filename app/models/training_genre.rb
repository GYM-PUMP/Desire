class TrainingGenre < ApplicationRecord
	has_many :trainings
	attachment :training_genre_image
	validates :training_genre_name, presence: true
	USER_CREATE_GENRE = 3
end
