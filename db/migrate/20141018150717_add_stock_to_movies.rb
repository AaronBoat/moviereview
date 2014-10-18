class AddStockToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :stock, :integer, default: 0
  	change_column :movies, :price, :decimal, precision: 8, scale: 2
  end
end
