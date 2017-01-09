class Dog < ApplicationRecord
  belongs_to :owner, optional: true
  has_many :rentals, dependent: :destroy
  has_many :sitters, through: :rentals
end
