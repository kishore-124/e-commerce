class CartsController < ApplicationController
  
  def index
    @orders = current_customer.orders.where(complete: false)
    sum = 0
    current_customer.orders.where(complete: false).map { |order| sum += (order.line_item.product.price * order.line_item.quantity) }
    @total_amount = sum.round(2)
    item = 0
    current_customer.orders.where(complete: false).map { |order| item +=  order.line_item.quantity }
    @items = item
  end
end
