class BookReview < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :rating, presence: true
  validates :content, presence: true
end
