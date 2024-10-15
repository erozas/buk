class Book < ApplicationRecord
  has_one_attached :cover
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
