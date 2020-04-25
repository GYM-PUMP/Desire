class SelectDailyCal < ApplicationRecord
	belongs_to :daily_cal, optional: true
	belongs_to :food, optional: true
	belongs_to :training, optional: true
end
