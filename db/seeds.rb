# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
products = [
  {title: 'Shirt', quantity: 50, description: 'Just a regular shirt(blue)'},
  {title: 'Rubber Duck', quantity: 5, description: 'Quacks in extremely high pitched frequency'},
  {title: 'A Billion Random Digits Book', quantity: 50, description: 'The pages are filled with a billion random digits'},
  {title: 'Magikarp', quantity: 0, description: 'A super cool pokemon'},
  {title: 'THE TEST PRODUCT', quantity: 1, description: 'This product has just one item in stock at the moment of it\'s creation'},
  {title: 'Dice', quantity: 50, description: 'A bundle with 10 dice (They are very small)'},
  {title: 'Vantablack Coffee', quantity: 50, description: 'Coffee grains harvested from the Vantablack Farm'}
]

products.each do |product|
  Product.create(
    title: product[:title],
    quantity: product[:quantity],
    description: product[:description]
  )
end