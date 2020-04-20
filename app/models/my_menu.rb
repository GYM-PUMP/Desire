class MyMenu < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :food, optional: true
	belongs_to :training, optional: true
end
