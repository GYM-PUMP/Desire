class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :supplement, optional: true
	belongs_to :gym, optional: true
end
