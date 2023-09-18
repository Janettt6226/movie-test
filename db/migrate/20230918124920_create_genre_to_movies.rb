class CreateGenreToMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :genre_to_movies do |t|
      t.references :movies, null: false, foreign_key: true
      t.references :genres, null: false, foreign_key: true

      t.timestamps
    end
  end
end
