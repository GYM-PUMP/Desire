class Training < ApplicationRecord
	belongs_to :training_genre
	belongs_to :user, optional: true
	has_many :my_menus, dependent: :destroy
	has_many :select_daily_cals
	attachment :training_image

	validates :training_name, presence: true
	validates :training_content, presence: true
end
