class OrderInfo
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal, :area_id, :city, :address, :building, :phone



  with_options presence: true do
    # バリデーション informationの
    validates :user_id
    validates :item_id


    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone


  end
  validates :building 
  # validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Info.create(postal: postal, area_id: area_id, city: city, adress: adress, building: building, phone: phone, order_id: order.id)
  end

end