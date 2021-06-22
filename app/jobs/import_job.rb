require 'csv'
class ImportJob < ApplicationJob
  queue_as :default

  def perform(id)
    import = Import.find(id).file
    import.blob.open do |blob|
      CSV.foreach(blob, liberal_parsing: true, headers: true) do |row|
        name = row['Product Name']
        price = row['Price']
        image_url = row['Image URLS']
        brand = row['Brand']
        new_product = Product.new(name: name, price: price, created_date: Date.current, image_url: image_url, brand_name: brand)
        new_product.save
      end
    end
  end
end
