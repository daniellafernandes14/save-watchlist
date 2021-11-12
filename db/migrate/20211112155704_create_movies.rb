class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
