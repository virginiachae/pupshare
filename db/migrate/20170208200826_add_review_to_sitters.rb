class AddReviewToSitters < ActiveRecord::Migration[5.0]
  def change
    add_reference :sitters, :review, foreign_key: true
  end
end
