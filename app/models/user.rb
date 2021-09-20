class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :ramen_images, dependent: :destroy
  has_many :ramen_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image
  #フォロー機能のアソシエーション
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
  
  # ユーザーをフォローする
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
  
  
  
  def self.search(search,word)#検索機能
          if search == "forward_match"
                          @user = User.where("username LIKE?","#{word}%")
          elsif search == "backward_match"
                          @user = User.where("username LIKE?","%#{word}")
          elsif search == "perfect_match"
                          @user = User.where("username LIKE?","%#{word}%")
          elsif search == "partial_match"
                          @user = User.where("username LIKE?","%#{word}%")
          else
                          @user = User.all
          end 
  end
  
  
end


