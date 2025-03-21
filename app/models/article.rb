class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true

  scope :published, -> { where.not(published_at: nil) }

  extend FriendlyId
  friendly_id :title, use: :slugged

  private

  def should_generate_new_friendly_id?
    title_changed?
  end
end
