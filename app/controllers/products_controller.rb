class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :add_quantity]
  before_action :authenticate_customer!, only: [:add_quantity]

  # GET /products or /products.json
  def index
    products = if params[:search].present?
                 Product.where("name ILIKE ?", "%#{params[:search]}%")
               else
                 Product.all
               end
    @products = products
  end

  def show; end

  def add_quantity
    order = Order.find_or_create_by(complete: false, customer_id: current_customer.id, product_id: @product.id)
    line_item = LineItem.find_or_create_by(order_id: order.id, product_id: @product.id, customer_id: current_customer.id)
    line_item.quantity = (params[:quantity].to_f + line_item.quantity.to_f)
    line_item.save

    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
