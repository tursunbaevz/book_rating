class Author < ApplicationRecord
	has_many :books, through: :repositories
	has_many :repositories
end
