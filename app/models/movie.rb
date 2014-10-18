class Movie < ActiveRecord::Base
	validates :title, :release_year, :price, :description, :director, :stock, presence: true

	validates :release_year, numericality: { only_integer: true}
	validates :title, uniqueness: true
	validates :stock, numericality: { only_integer: true}
	validates :price, numericality: { greater_than_or_equal_to: 0.01}
end
 