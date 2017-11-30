class OrderItem < ApplicationRecord
	belongs_to :order
	has_one :book

  validates :bookQuantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :book_present
  validate :order_present

  def unit_price
      book.price
  end

  def total_price
    unit_price * bookQuantity
  end

private
  def book_present
    if book.nil?
      errors.add(:book, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end
end