class DailyCal < ApplicationRecord
	has_many :select_daily_cals, dependent: :destroy
	belongs_to :user
end
