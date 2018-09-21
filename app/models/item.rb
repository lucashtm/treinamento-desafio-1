class Item < ApplicationRecord
  belongs_to :product
  belongs_to :user

  after_save :destroy_if_none

  scope :by_product_id, -> product_id do
    joins(:product).where(products: {id: product_id})
  end

  scope :in_stock, -> do
    joins(:product).where('products.quantity >= items.quantity')
  end

  scope :not_in_stock, -> do
    joins(:product).where.not('products.quantity >= items.quantity')
  end

  private

  def destroy_if_none
    destroy if quantity <= 0
  end
end
