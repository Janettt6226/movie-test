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
Genre.destroy_all
Actor.destroy_all
GenreToMovie.destroy_all
ActorsToMovie.destroy_all

puts "==========================================="
puts "Creating genres..."
puts "==========================================="
movies.take(10).each do |movie|
  # Ici je récupère les 10 premiers films
  # movie["genre"].each do |f|
  movie["genre"].each do |f|
    # ici je regarde les genres associés aux 10 films
    new_genre = Genre.create(name: f)
    puts new_genre.name
  end
end

# Genre.select(:name).map(&:name).uniq
# --> array avec les genres uniques



puts "==========================================="
puts "Creating movies..."
puts "==========================================="
movies.take(10).each do |movie|
  new_movie = Movie.create(
    title: movie["title"],
    year: movie["year"],
    image: movie["image"],
    score: movie["score"],
    rating: movie["rating"]
  )
  puts new_movie.title
end

puts "==========================================="
puts "Creating actors..."
puts "==========================================="

movies.take(10).each do |movie|
  new_actor = Actor.new
  movie["actors"].each do |f|
    new_actor = Actor.create(name: f)
  end
  movie["actor_facets"].each do |f|
    new_actor.update(image: f)
  end
  puts new_actor.name
end

puts "==========================================="
puts "Creating associated actors..."
puts "==========================================="

10.times do
  ActorsToMovie.create(
    movie_id: Movie.all.to_a.sample.id,
    actor_id: Actor.all.to_a.sample.id
  )
end

puts "==========================================="
puts "Creating associated genres..."
puts "==========================================="

10.times do
  GenreToMovie.create(
    movie_id: Movie.all.to_a.sample.id,
    genre_id: Genre.all.to_a.sample.id
  )
end
