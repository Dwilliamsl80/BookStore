class CartsController < ApplicationController
	before_action :authenticate_user!
  def show
    @order_items = current_order.order_items
    @invoices = current_user.invoices
  end
end