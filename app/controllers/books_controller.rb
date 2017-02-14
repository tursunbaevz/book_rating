class BooksController < ApplicationController
	def new
		@book = current_user.books.build
	end

	def index
		@books = Book.all.order("created_at DESC")
	end

	def create
		@book = current_user.books.build(params_book)
		if 
			@book.save
			redirect_to root_path
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
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@book.update(params_book)

		redirect_to root_url
	end


	def params_book
		params.require(:book).permit(:name, :description, :category_id, :user_id, :image, :author_id)
	end
end
