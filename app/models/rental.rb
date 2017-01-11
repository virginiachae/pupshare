class Rental < ApplicationRecord
  belongs_to :dog
  belongs_to :sitter
end
