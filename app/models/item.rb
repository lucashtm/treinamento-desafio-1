class Item < ApplicationRecord
  belongs_to :product
  belongs_to :user

  after_save :destroy_if_none

  scope :by_product_id, -> product_id do
    joins(:product).where(products: {id: product_id})
  end

  private

  def destroy_if_none
    destroy if quantity <= 0
  end
end
