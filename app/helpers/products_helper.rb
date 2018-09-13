module ProductsHelper
  def render_product(product)
    tag = product.quantity.zero? ? 'del' : 'span'
    out_of_stock = product.quantity.zero? ? '<h4 class="out">OUT OF STOCK</h4>' : ''
    title = "<h2><#{tag}>#{product.title}</#{tag}></h2>"
    description = "<p><#{tag}>#{product.description}</#{tag}></p>"
    data = title+description+out_of_stock
    data.html_safe
  end

  def add_to_cart(product)
    options = { remote: true, method: :patch, class: 'add-to-cart' }
    path = cart_path(product_id: product.id, op: :add)
    link_to 'ADD TO CART', path, options unless product.quantity.zero?
  end
end
