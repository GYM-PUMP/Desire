class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :contacts, dependent: :destroy

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得

  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

  belongs_to :gym, optional: true

  attachment :image, destroy: false

#google API ------------------

  geocoded_by :address
  after_validation :geocode

#-------------------------------------------
# validatesion -----------------------------

validates :name, presence: true

validates :name,
    length: { minimum: 2, maximum: 20 }

#-------------------------------------------

# ユーザーをフォローする-----------------------
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end
#-------------------------------------------
# 体組成計算 ---------------------------------

  MOVEMENT_FACTOR = {
      # 英語にした方がいい
      "普段運動しない": 1.2,
      "週に１回〜２回軽く運動する": 1.375,
      "週に２回〜３回筋トレする": 1.55,
      "週に４回〜６回激しい筋トレする": 1.725,
      "筋トレ上級者": 1.9
    }


  def basal_metabolism
    if gender
      return (13.397*weight)+(4.799*height)+(5.677*age)+88.362
    else
      return (9.247*weight)+(3.098*height)+(4.33*age)+447.593
    end
  end

  def protain_factor
    as = [
      {"move" => 1.2, "protein" => 1.2},
      {"move" => 1.375, "protein" => 1.5},
      {"move" => 1.55, "protein" => 1.9},
      {"move" => 1.725, "protein" => 2.2},
      {"move" => 1.9, "protein" => 2.5}
    ]

    as.find { |a| a["move"] == movement }["protein"]
  end

  def total_ingestion_cal
    return { "basal_metabolism" => basal_metabolism * movement, "protein" => weight * protain_factor }
  end

end