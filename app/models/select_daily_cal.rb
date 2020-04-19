class SelectDailyCal < ApplicationRecord
	belongs_to :food
	belongs_to :training
	belongs_to :daily_cal
end
