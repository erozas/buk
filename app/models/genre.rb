class Genre < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :books, through: :book_genres
  has_many :book_genres, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true  

  scope :alphabetical, -> { order("LOWER(name) ASC") }
end
