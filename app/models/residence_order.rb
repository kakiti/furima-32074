class ResidenceOrder
  include ActiveModel::Model
  attr_accessor :price, :token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id
  with_options presence: true do
    validates :token
    validates :postal_code,   format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :phone_number,  format: {with: /\A\d{1,11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 1 } 

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: params[:price],
      card: params[:token],
      currency: 'jpy'
    )
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Residence.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end