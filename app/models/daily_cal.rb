class DailyCal < ApplicationRecord
	belongs_to :user
	has_many :select_daily_cals, dependent: :destroy
end
