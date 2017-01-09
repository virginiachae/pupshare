class Sitter < ApplicationRecord
    has_many :rentals, dependent: :destroy
    has_many :dogs, through: :rentals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
