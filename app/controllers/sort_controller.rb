class SortController < ApplicationController
  def index
  	  @books = Book.all
      @order_item = current_order.order_items.new
      @categories = Category.all
      @publishers = Publisher.all
      @authors = Author.all
  end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.fetch(:book, {})
    end
end
