class Import < ApplicationRecord

  has_one_attached :file
  after_create :add_products

  def add_products
    ImportJob.perform_later(id)
  end
end
