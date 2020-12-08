class Residence < ApplicationRecord
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 1 } do
    validates :city
    validates :address
    validates :phone_number
  end

  belongs_to :order
end
