class Actor < ApplicationRecord
  has_many :movies, through: :actors_to_movies
end
