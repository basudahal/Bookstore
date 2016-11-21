class Book < ApplicationRecord
	before_validation :generate_slug
	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :fans, through: :favorites, source: :user
	has_many :characterizations, dependent: :destroy
	has_many :genres, through: :characterizations
	validates :publish_year, :num_pages, presence: true
	validates :name, presence: true, uniqueness: true
	validates :slug, uniqueness: true
	validates :description, length: { minimum: 25 }
	validates :price, numericality: { greater_than_or_equal_to: 0 }
	validates :image_file_name, allow_blank: true, format: {
	  with:    /\w+\.(gif|jpg|png)\z/i,
	  message: "must reference a GIF, JPG, or PNG image"
	}
	def onsale?
		price.blank? || price < 30
	end
	def self.published
		where("publish_year <= ?", Time.now).order("publish_year desc")
	end
	def average_stars
	  reviews.average(:stars)
	end
	def to_param
		slug
	end
	def generate_slug
	  self.slug ||= name.parameterize if name
	end
end
