class Item < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_one_attached :image

  # アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :cost, :area, :needday

  # バリデーション
  validates :product, :explanation, :price, :user, presence: true
  validates :category_id, :status_id, :cost_id, :area_id, :needday_id, presence: true, numericality:{other_than: 1, message: "can't be blank"}
end
