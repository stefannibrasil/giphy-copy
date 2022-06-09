class User < ApplicationRecord
  include ActiveModel::SecurePassword

  has_many :gifs, dependent: :destroy
  validates :username, presence: true, uniqueness: true

  has_secure_password

  before_save :downcase_username

  private

  def downcase_username
    self.username = username.downcase
  end
end
