class AddSitterToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :sitter, foreign_key: true
  end
end
