class OrderItemsController < ApplicationController
  def create
    @order = current_order

    #@order.order_items = ActiveRecord::Base.connection.execute("call proc_InsertOrderItem (#{order_item_params[:book_id]}, #{current_order.id}, #{order_item_params[:bookQuantity]} )")
    #@item_exists = @order.order_items.find_all { |oi| oi.book_id == order_item_params[:book_id] }
    #if @item_exists.size > 0 then
    #  @order.order_items.find
    #else
      #puts "book id = #{order_item_params[:book_id]} order id = #{@order.id} bookQuantity = #{order_item_params[:bookQuantity]}"
      #@order_item = @order.order_items.new(ActiveRecord::Base.connection.execute("call proc_InsertOrderItem (#{order_item_params[:book_id]}, #{current_order.id}, #{order_item_params[:bookQuantity]} )"))
      @order_item = @order.order_items.new(order_item_params)
    #end)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end
private
  def order_item_params
    params.require(:order_item).permit( :book_id, :order_id, :bookQuantity)
  end
end