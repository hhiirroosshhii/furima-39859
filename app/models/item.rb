class Item < ApplicationRecord
 # バリデーション
 validates :product, presence: true
 validates :explanation, presence: true
 validates :category_id,  presence: true, numericality: { other_than: 1, message: "can't be blank" }
 validates :status_id,  presence: true, numericality: { other_than: 1, message: "can't be blank" }
 validates :cost_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
 validates :area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
 validates :needday_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }

 validates :image, presence: true
 validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }


  # アソシエーション
  belongs_to :user
  has_one :order
  has_one_attached :image


  # アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cost
  belongs_to_active_hash :area
  belongs_to_active_hash :needday
end
