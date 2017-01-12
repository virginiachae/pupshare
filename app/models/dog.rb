class Dog < ApplicationRecord
  belongs_to :owner, optional: true
  has_many :rentals, dependent: :destroy
  has_many :sitters, through: :rentals

  geocoded_by :address
  after_validation :geocode

  has_attached_file :image, styles: { medium: "300x300>", thumb: "50x50>", small: "25x25>" }, default_url: "http://i.imgur.com/25J4pFo.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
