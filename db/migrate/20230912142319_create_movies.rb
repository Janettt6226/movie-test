class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :image
      t.float :score
      t.integer :rating
      t.string :genre

      t.timestamps
    end
  end
end
