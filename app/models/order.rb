class Order < ApplicationRecord
	has_many :order_items

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.bookQuantity * oi.unit_price) : 0 }.sum
  end

end
