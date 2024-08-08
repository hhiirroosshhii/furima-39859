class Information < ApplicationRecord
  # アソシエーション
  belong_to :order

  # バリデーション
   # 数字3桁、ハイフン、数字4桁の並びのみ許可する
   validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
   # 0以外の整数を許可する
   validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

   validates :city, presence: true
   validates :house, presence: true
   validates :building 
   validates :donation, presence: true


end
