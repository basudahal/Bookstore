module ApplicationHelper
	def page_title
		if content_for?(:title)
			"Books - #{content_for(:title)}"
		else
			"Books"
		end
	end
end
