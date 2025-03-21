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
require "test_helper"

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
