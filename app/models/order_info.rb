class OrderInfo
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal, :locate, :city, :address, :building, :phone


  with_options presence: true do
    # バリデーション informationの
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    
    validates :city
    validates :address
    validates :phone

    validates :user_id
    validates :item_id
  end
  validates :locate, numericality: {other_than: 0, message: "can't be blank"}
  validate :building 

   def save
     order = Order.create(user_id: user_id, item_id: item_id)
     Info.create(postal: postal, locate: locate, city: city, address: address, building: building, phone: phone, order_id: order.id)
   end

end