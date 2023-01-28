class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  #ActiveHashのアソシエーション
  belongs_to :category
  belongs_to :state
  belongs_to :postage
  belongs_to :area
  belongs_to :sipping_day

  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :user_id
    validates :name
    validates :image
    validates :explanation
    validates :category_id
    validates :state_id
    validates :postage_id
    validates :area_id
    validates :sipping_day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :postage_id
    validates :area_id
    validates :sipping_day_id
  end

end