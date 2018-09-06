class CartController < ApplicationController
  def edit
  end

  def update
    if item_in_cart?
      item = current_user.items.by_product_id(params[:product_id]).first
      item.quantity += 1
      item.save
    else
      current_user.items << Item.create(product_id: params[:product_id], quantity: 1)
    end
  end

  def delete
  end

  private

  def item_in_cart?
    params[:product_id].to_i.in?(user_items_products)
  end

  def user_items_products
    current_user.items.pluck(:product_id)
  end
end
