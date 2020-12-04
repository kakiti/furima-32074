class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :title
    validates :concept
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } 
  end
  with_options numericality: {other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :prefecture_id
    validates :schedule_id 
  end


  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :fee
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :schedule

end
