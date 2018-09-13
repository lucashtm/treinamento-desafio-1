class CartController < ApplicationController
  def edit
  end

  def update
    send((params[:op]+'_item').to_sym)
  end

  def delete
  end

  private

  def add_item
    if item_in_cart?
      add_present_item
    else
      add_new_item
    end
  end

  def add_new_item
    item = Item.create(product_id: params[:product_id], quantity: 1)
    current_user.items << item
    item.save
  end

  def add_present_item
    item = current_user.items.by_product_id(params[:product_id]).first
    item.quantity += 1
    item.save
  end

  def remove_item
    if item_in_cart?
      item = current_user.items.by_product_id(params[:product_id]).first
      item.quantity -= 1
      item.save
    end
  end

  def item_in_cart?
    params[:product_id].to_i.in?(user_items_products)
  end

  def user_items_products
    current_user.items.pluck(:product_id)
  end
end
