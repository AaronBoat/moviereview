module MoviesHelper
	def print_stock (stock, quantity_requested =1)
	 if stock == 0
		content_tag(:span, "Out of Stock", class: "out_stock")
	 elsif stock >= quantity_requested
	   content_tag(:span, "In stock (#{stock})" , class: "in_stock")
	 else
	   content_tag(:span, "Insufficient stock (#{stock})", class: "low_stock")
	 end
   end

    def print_price(price)
		number_to_currency price
    end
 end
