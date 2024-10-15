class User < ApplicationRecord
  has_one_attached :avatar
  has_many :book_reviews, dependent: :destroy
  has_many :reviewed_books, through: :book_reviews, source: :book
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  extend FriendlyId
  friendly_id :username, use: :slugged


  private
  
  def should_generate_new_friendly_id?
    username_changed? || super
  end
end
