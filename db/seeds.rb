# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

url = "https://gist.githubusercontent.com/alexandremeunier/49533eebe2ec93b14d32b2333272f9f8/raw/924d89e2236ca6fa2ade7481c91bfbf858c49531/movies.json"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

Movie.destroy_all

puts "==========================================="
puts "Creating movies..."
puts "==========================================="
movies.take(10).each do |movie|
  new_movie = Movie.new(
    title: movie["title"],
    year: movie["year"],
    image: movie["image"],
    score: movie["score"],
    rating: movie["rating"]
  )
  puts new_movie.title
  new_movie.save!
end
