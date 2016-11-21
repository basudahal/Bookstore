module BooksHelper
	def format_total_gross(book)
		if book.onsale?
			content_tag(:strong, number_to_currency(book.price))
		else
			number_to_currency(book.price)
		end
	end
	def image_for(book)
		if book.image_file_name.blank?
			image_tag("Placeholder.png")
		else
			image_tag(book.image_file_name)
		end
	end
end
