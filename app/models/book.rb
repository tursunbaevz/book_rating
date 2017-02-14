class Book < ApplicationRecord
	belongs_to :category
	belongs_to :user
	has_many :authors, through: :repositories
	has_many :repositories



	  has_attached_file :image,
                    styles: { medium: '450x550>', thumb: '300x350>'},
                    default_url: '/images/:style/missing.png'
  		validates_attachment_content_type :image, 
                    content_type: ['image/jpeg', 'image/gif', 'image/png']

end
