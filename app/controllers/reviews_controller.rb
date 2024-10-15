class ReviewsController < ApplicationController
  before_action :set_book

  def new
    @book_review = current_user.book_reviews.build
  end

  def create
    @book_review = current_user.book_reviews.build(book_review_params)
    if @book_review.save!
      redirect_to book_path(@book.slug), notice: "Review created successfully"
    else
      render :new, alert: "There was an issue creating your review"
    end
  end

  private

  def set_book
    @book = Book.friendly.find(params[:book_id])
  end

  def book_review_params
    params.require(:book_review).permit(:rating, :content).merge(book_id: @book.id)
  end
end
