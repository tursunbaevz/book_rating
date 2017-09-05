class BooksController < ApplicationController
	def new
		@book = current_user.books.build
	end

	def index
		@books = Book.search(params[:search])
		
	end

	def create
		@book = current_user.books.build(params_book)
		if 
			@book.save
			redirect_to books_path
		else
			render 'new'
		end
	end


	def destroy
		@book = Book.find(params[:id])
		@book.destroy

		redirect_to root_url
	end

	def show
		@reviews = Review.all
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@book.update(params_book)

		redirect_to book_path
	end


	def params_book
		params.require(:book).permit(:name, :description, :cost, :category_id, :comment, :raiting, :user_id, :image, author_ids: [] )
	end
end
