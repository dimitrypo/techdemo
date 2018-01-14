class Article < ApplicationRecord
  has_attached_file :image
  validates_attachment_file_name :image, :matches => [/png\Z/i, /jpe?g\Z/i]
end
