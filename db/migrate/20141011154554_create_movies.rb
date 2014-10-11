class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :release_year
      t.decimal :price
      t.text :description
      t.string :director

      t.timestamps
    end
  end
end
