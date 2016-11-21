module ReviewsHelper
	def format_average_stars(book)
	  if book.average_stars.nil?
	    content_tag(:strong, 'No reviews')
	  else
	    pluralize(number_with_precision(book.average_stars, precision: 1) , 'star')
	  end
	end
end
