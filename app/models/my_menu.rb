class MyMenu < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :food, optional: true
	belongs_to :training, optional: true

	# validates :training_quantity, presence: true
	# validates :food_quantity, presence: true
end
