class Movie < ApplicationRecord
  has_many :actors, through: :genre_to_movies
  has_many :genres, through: :actors_to_movies
end
