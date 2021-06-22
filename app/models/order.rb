class Order < ApplicationRecord
  belongs_to :customer
  has_one :line_item
end
