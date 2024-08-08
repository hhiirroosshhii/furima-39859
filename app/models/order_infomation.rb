class OrderInfomation
  include ActiveModel::Model
  attr_accessor :postal, :area_id, :city, :adress, :building, :phone, :order_id



  with_options presence: true do
    # バリデーション informationの
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone


    validates :order_id
  end
  validates :building 
  # validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Information.create(postal: postal, area_id: area_id, city: city, adress: adress, building: building, phone: phone, order_id: order_id)
  end

end