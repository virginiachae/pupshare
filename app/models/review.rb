class Review < ApplicationRecord
  belongs_to :dog, optional: true
  belongs_to :sitter, optional: true
end
