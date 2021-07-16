class AddClientJob < ApplicationJob
  queue_as :default

  def perform
    1.upto(2000) do
      Customer.create(email: Faker::Internet.email, name: Faker::Name.unique.name, password: SecureRandom.base64.first(8),
                              address: "test address")
    end
  end
end
