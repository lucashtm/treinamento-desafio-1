module ProductsHelper
  def render_product(product)
    tag = product.quantity.zero? ? 'del' : 'span'
    stock = product.quantity.zero? ? '<h4 class="out">OUT OF STOCK</h4>' : "<h4>#{product.quantity} in stock</h4>"
    title = "<h2><#{tag}>#{product.title}</#{tag}></h2>"
    price = "<h4>R$ #{'%.2f' % product.price}</h4>"
    description = "<p><#{tag}>#{product.description}</#{tag}></p>"
    data = title+description+stock+price
    data.html_safe
  end

  def add_to_cart(product)
    options = { remote: true, method: :patch, class: 'add-to-cart' }
    path = cart_path(product_id: product.id, op: :add)
    link_to 'ADD TO CART', path, options unless product.quantity.zero?
  end
end
