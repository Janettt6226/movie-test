class RenameMoviesIdToMovieId < ActiveRecord::Migration[7.0]
  def change
    rename_column :genre_to_movies, :movies_id, :movie_id
    rename_column :genre_to_movies, :genres_id, :genre_id
  end
end
