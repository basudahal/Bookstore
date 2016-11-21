class ReviewsController < ApplicationController
	before_action :require_signin
	before_action :set_book
	def index
		@reviews = @book.reviews
	end
	def new
		@review = @book.reviews.new
	end
	def create
	  @review = @book.reviews.new(review_params)
	  @review.user = current_user
	  if @review.save
	    redirect_to book_reviews_path(@book),
	                  notice: "Thanks for your review!"
	  else
	    render :new
	  end
	end

	private

	def review_params
	  params.require(:review).permit(:comment, :stars)
	end
	def set_book
		@book = Book.find(params[:book_id])
	end
end
