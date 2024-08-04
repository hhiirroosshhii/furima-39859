class Item < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_one_attached :image

  # アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to :status
  belongs_to :cost
  belongs_to :area
  belongs_to :needday

  # バリデーション
  validates :product, :explanation, :price, :user, presence: true
  validates :category_id, :status_id, :cost_id, :area_id, :needday_id, presence: true, numericality:{other_than: 1, message: "can't be blank"}
  validates :image, presence: true
end
