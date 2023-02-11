class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  nas_one :Place
end
