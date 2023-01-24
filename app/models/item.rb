class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :user_id
    validates :explanation
    validates :category_id
    validates :state_id
    validates :postage_id
    validates :area_id
    validates :sipping_day_id
    validates :price
end
