class Actor < ApplicationRecord
  has_many :actors_to_movies, dependent: :destroy
  has_many :movies, through: :actors_to_movies, class_name: 'Movie'
end
