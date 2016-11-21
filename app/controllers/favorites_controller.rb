class FavoritesController < ApplicationController
	before_action :require_signin
	before_action :set_book
	def create
		@book.favorites.create!(user: current_user)
		redirect_to @book, notice: "Thanks for fav'ing this book!"
	end
	def destroy
	  	favorite = current_user.favorites.find(params[:id])
	  	favorite.destroy
	  	redirect_to @book, notice: "Oh! Stop it."
	end

	private

	  def set_book
	    @book = Book.find_by!(slug: params[:id])
	  end
end
