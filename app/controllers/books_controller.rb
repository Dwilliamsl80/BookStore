class BooksController < ApplicationController

  def index
  	  @books = Book.all.paginate(page: params[:page], per_page: 24)
   	  @order_item = current_order.order_items.new
  end
end
