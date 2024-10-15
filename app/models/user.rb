class User < ApplicationRecord
  has_one_attached :avatar
  
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
