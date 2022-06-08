class Gif < ApplicationRecord
  # belongs_to :user
  has_one_attached :image

  validate :acceptable_image

  private

  def acceptable_image
    return unless image.attached?
  
    unless image.byte_size <= 1.megabyte
      errors.add(:image, "is too big")
      image.purge
    end
  
    unless image.content_type == "image/gif"
      errors.add(:image, "must be a GIF file")
      image.purge
    end
  end
end
