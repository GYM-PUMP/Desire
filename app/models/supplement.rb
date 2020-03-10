class Supplement < ApplicationRecord
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	belongs_to :genre
end
