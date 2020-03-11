class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :supplement
	belongs_to :gym
end
