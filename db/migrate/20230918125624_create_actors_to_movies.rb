class CreateActorsToMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :actors_to_movies do |t|
      t.references :actor, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
