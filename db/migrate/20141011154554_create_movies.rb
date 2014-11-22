class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :release_year
      t.integer :price
      t.text :description
      t.string :stock

      t.timestamps
    end
  end
end
