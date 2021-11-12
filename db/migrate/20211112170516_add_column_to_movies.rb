class AddColumnToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :movie_image, :string
  end
end
