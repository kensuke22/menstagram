class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :ramen_images, dependent: :destroy
  has_many :ramen_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image
  
  def self.search(search,word)
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
