class Genre < ApplicationRecord
  has_many :movies, through: :genre_to_movies
end
