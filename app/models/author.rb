class Author < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :book_authors, dependent: :destroy
  has_many :books, through: :book_authors

  scope :alphabetical, -> { order(last_name: :asc) }

  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["birthdate", "bio", "created_at", "first_name", "id", "last_name", "nationality", "slug", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["books"]
  end

  def name
    "#{first_name} #{last_name}"
  end
end
