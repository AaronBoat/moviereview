class MovieItem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :movie

    validates :movie_id, :cart_id, :quantity, presence: true
    validates :quantity, numericality: { only_integer: true, greater_than: 0}

    def subtotal
      movie.price * quantity
    end 
  end