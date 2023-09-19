class Movie < ApplicationRecord
  has_many :actors_to_movies, dependent: :destroy
  has_many :actors, through: :actors_to_movies, class_name: 'Actor'
  has_many :genre_to_movies, dependent: :destroy
  has_many :genres, through: :genre_to_movies, class_name: 'Genre'
  validates :title, :year, presence: true
  # validates :year, numericaly: { only_integer: true }
  # validates :year, inclusion: { in: 1885..2026 }
  # validates :score, :rating, presence: true

end
