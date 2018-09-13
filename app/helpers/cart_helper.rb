module CartHelper
  def add_item(id)
    link_to '+', cart_path(product_id: id, op: :add), method: :put, remote: true
  end

  def remove_item(id)
    link_to '-', cart_path(product_id: id, op: :remove), method: :put, remote: true
  end
end