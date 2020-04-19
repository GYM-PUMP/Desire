class MyMenu < ApplicationRecord
	belongs_to :user
	belongs_to :food
	belongs_to :training
end
