class BooksController < ApplicationController
	before_action :require_signin, except: [:index, :show]
	before_action :require_admin, except: [:index, :show]
	before_action :set_book, only: [:show, :edit, :update, :destroy]
	def index
		@books = Book.published
	end
	def show
		@fans = @book.fans
		@genres = @book.genres
	    if current_user
	       @current_favorite = current_user.favorites.find_by(book_id: @book.id)
	    end
	end
	def edit
	end
	def update
		if @book.update(book_params)
			flash[:notice] = "Book successfully updated!"
		    redirect_to @book
		else
		    render :edit
		end
	end
	def new
		@book = Book.new
	end
	def create 
		if @book.save
			flash[:notice] = "Book successfully Created!"
	    	redirect_to @book
	  	else
	    	render :new
	  	end
	end
	def destroy
		@book.destroy
		redirect_to movies_url, alert: "Book successfully deleted!"
	end

	private
	
	def set_book
		@book = Book.find_by!(slug: params[:id])
	end
	def book_params
		params.require(:book).permit(:name, :description, 
			:author, :isbn, :rating, :publish_year, :price, 
			:condition, :book_cover, :num_pages, :image_file_name, :publisher, genre_ids: [])
	end
end
