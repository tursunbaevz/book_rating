class AuthorsController < ApplicationController
	def new
		@author = Author.new
	end

	def index
		@authors = Author.all
	end

	def create
		@author = Author.new(author_params)
		if 
			@author.save

			redirect_to root_path
		else
			render 'new'

		end
	end

	def author_params
		params.require(:author).permit(:name)
	end
end
