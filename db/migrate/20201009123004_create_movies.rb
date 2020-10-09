class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :release_date
      t.text :description
      t.string :poster
      t.float :score
      t.string :genres

      t.timestamps
    end
  end
end
