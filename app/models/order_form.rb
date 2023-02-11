class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :building, :tel_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :area_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :house_number
    validates :tel_number, format: { with: /\A[0-9]{10,11}\z/, message: "is invalid" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Place.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, building: building, tel_number: tel_number, order_id: order.id)
  end
end
