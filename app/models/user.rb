class User < ApplicationRecord
  has_many :gifs, dependent: :destroy
end
