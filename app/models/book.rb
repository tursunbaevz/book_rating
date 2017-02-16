class Book < ApplicationRecord
	belongs_to :category
	belongs_to :user
	has_many :authors, through: :repositories
	has_many :repositories
	accepts_nested_attributes_for :authors
	has_many :reviews





  def authors_attributes=(author_attributes)
    author_attributes.values.each do |author_attribute|
      author = Author.find_or_create_by(author_attribute)
      self.authors << author
    end
  end



	  has_attached_file :image,
                    styles: { medium: '450x550>', thumb: '300x350>'},
                    default_url: '/images/:style/missing.png'
  		validates_attachment_content_type :image, 
                    content_type: ['image/jpeg', 'image/gif', 'image/png']

end
