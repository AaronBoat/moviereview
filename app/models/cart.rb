class Cart < ActiveRecord::Base
	has_many :movie_items, dependent: :destroy

   def total
	 movie_items.to_a.sum {|movie_item| movie_item.subtotal}
   end
end
