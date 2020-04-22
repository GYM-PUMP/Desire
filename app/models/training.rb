class Training < ApplicationRecord
	belongs_to :training_genre
	has_many :my_menus, dependent: :destroy
	attachment :training_image

	validates :training_name, presence: true
	validates :training_content, presence: true
end
