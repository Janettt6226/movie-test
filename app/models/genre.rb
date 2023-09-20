class Genre < ApplicationRecord
  has_many :genre_to_movies, dependent: :destroy
  has_many :movies, through: :genre_to_movies, class_name: 'Actor'

end
