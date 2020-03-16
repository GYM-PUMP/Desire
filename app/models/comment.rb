class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :supplement, optional: true
end
