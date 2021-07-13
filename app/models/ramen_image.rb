class RamenImage < ApplicationRecord
  
  belongs_to :user
  attachment :image # 画像投稿する為に追加（_idは含めない）
  has_many :ramen_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :shop_name, presence: true
  validates :image, presence: true
  validates :caption, presence: true
  validates :taste, presence: true
  validates :address, presence: true
  validates :tax_price, presence: true
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
