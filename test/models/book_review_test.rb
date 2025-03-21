# == Schema Information
#
# Table name: book_reviews
#
#  id         :bigint           not null, primary key
#  content    :text
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_book_reviews_on_book_id  (book_id)
#  index_book_reviews_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class BookReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
