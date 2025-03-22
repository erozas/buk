# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  author_name :string
#  description :text
#  excerpt     :text
#  isbn        :string
#  pages_count :integer          default(0)
#  slug        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_books_on_slug   (slug) UNIQUE
#  index_books_on_title  (title) UNIQUE
#
class Book < ApplicationRecord
  has_one_attached :cover

  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres
  has_many :reviews, class_name: "BookReview", dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :isbn,  presence: true, uniqueness: true
  validates :author_name, presence: true
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  private

  def should_generate_new_friendly_id?
    title_changed? || super
  end
end
