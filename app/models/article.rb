class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  private

  def should_generate_new_friendly_id?
    title_changed?
  end
end
