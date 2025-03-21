class ConnectedService < ApplicationRecord
  belongs_to :user

  validates :provider, :uid, presence: true
end
