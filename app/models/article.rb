# == Schema Information
#
# Table name: articles
#
#  id           :bigint           not null, primary key
#  content      :text
#  excerpt      :string
#  published    :boolean          default(FALSE)
#  published_at :datetime
#  slug         :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_articles_on_slug     (slug) UNIQUE
#  index_articles_on_title    (title) UNIQUE
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true

  scope :published, -> { where.not(published_at: nil) }

  extend FriendlyId
  friendly_id :title, use: :slugged

  def formatted_content
    MarkdownRenderer.render(content)
  end

  private

  def should_generate_new_friendly_id?
    title_changed?
  end
end
