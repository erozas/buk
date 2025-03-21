class User < ApplicationRecord
  OAUTH_PROVIDERS = [
    { name: :github, humanized_name: "GitHub" },
    { name: :google_oauth2, humanized_name: "Google" }
  ]
  has_one_attached :avatar
  has_many :book_reviews, dependent: :destroy
  has_many :reviewed_books, through: :book_reviews, source: :book
  has_many :connected_services, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, 
         omniauth_providers: [:github, :google_oauth2]
  
  extend FriendlyId
  friendly_id :username, use: :slugged


  def self.from_omniauth(auth)
    if where(email: auth.info.email).exists?
      return_user = where(email: auth.info.email).first
      return_user.provider = auth.provider
      return_user.uid = auth.uid
    else
      return_user = where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.username = auth.info.name
      end
    end
    return_user
  end

  private
  
  def should_generate_new_friendly_id?
    username_changed? || super
  end
end
