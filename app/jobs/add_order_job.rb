class AddOrderJob < ApplicationJob
  queue_as :default

  def perform
    Customer.all.each do |customer|
      Order.create(customer_id: customer.id, transaction_id: SecureRandom.base64.first(8),
                   product_id: Product.first.id, complete: true)
    end
  end
end
