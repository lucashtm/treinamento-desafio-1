class Item < ApplicationRecord
  belongs_to :product
  belongs_to :user

  scope :by_product_id, -> product_id do
    joins(:product).where(products: {id: product_id})
  end 
end
