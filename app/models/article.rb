class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_attached_file :image, styles: { medium: "600x600>", thumb: "200x200>" }, default_url: "missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title, presence: true,
                    length: { minimum: 5 }
end