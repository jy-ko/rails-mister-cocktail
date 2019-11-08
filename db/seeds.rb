# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'json'
require 'open-uri'

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all
puts "Creating ingredients..."
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
user_serialized = open(url).read
user = JSON.parse(user_serialized)
user['drinks'].each do |hash|
  Ingredient.create(name: hash['strIngredient1'])
end



COCKTAIL_URLS = ["https://images.pexels.com/photos/1304540/pexels-photo-1304540.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
'https://images.pexels.com/photos/1187766/pexels-photo-1187766.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
'https://images.pexels.com/photos/2093089/pexels-photo-2093089.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
'https://images.pexels.com/photos/2480828/pexels-photo-2480828.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
'https://images.pexels.com/photos/2167793/pexels-photo-2167793.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500']


COCKTAIL_URLS.each do |cocktail_url|
  cocktail = Cocktail.new(name:Faker::ProgrammingLanguage.name)
  cocktail.remote_photo_url = cocktail_url
  cocktail.save
end
