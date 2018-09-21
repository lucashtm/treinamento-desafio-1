class PurchasesController < ApplicationController
  def new
    not_in_stock = user_items.not_in_stock
    if not_in_stock.any?
      error_flash(not_in_stock)
      redirect_to edit_cart_path
    end
  end

  def create
    method = Payment::MethodProvider.for(payment_method)
    method.confirm
    clear_cart
    success_flash
    redirect_to :root
  end

  private

  def set_purchase
    total = user_items.inject(0) { |t, i| t+i.quantity*i.product.price }
  end
  
  def user_items
    current_user.items
  end

  def payment_method
    params[:purchase][:payment_method].to_sym
  end

  def payment_name
    params[:purchase][:payment_method].humanize
  end

  def clear_cart
    remove_from_stock
    user_items.destroy_all
  end

  def remove_from_stock
    user_items.map do |item|
      item.product.quantity -= item.quantity
      item.product.save
    end
  end

  def error_flash(not_in_stock)
    not_in_stock = not_in_stock.map { |item| item.product.title }
    flash[:error] = 'The products: '+not_in_stock.join(', ') + '. Are not in stock :('
  end

  def success_flash
    flash[:success] = payment_name+': Your purchase was confirmed :)'
  end

end
