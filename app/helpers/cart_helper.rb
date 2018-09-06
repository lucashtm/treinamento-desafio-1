module CartHelper
  def add_item(id)
    link_to '+', cart_path(product_id: id)
  end

  def remove_item
    link_to '-', cart_path(product_id: id)
  end
end