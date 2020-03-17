class Supplement < ApplicationRecord
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	belongs_to :genre
	attachment :supple_image

	def liked_by?(user)
          likes.where(user_id: user.id).exists?
    end
end
