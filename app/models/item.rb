class Item < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_one_attached :image

  # アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :area
  belongs_to :needday

  # バリデーション
  validates :product, :user_id, presence: true
  validates :explanation, presence: true
  validates :category_id, :status_id, :cost_id, :area_id, :needday_id, presence: true,
                                                                       numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
