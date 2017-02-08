class AddReviewRefToDogs < ActiveRecord::Migration[5.0]
  def change
    add_reference :dogs, :review, foreign_key: true
  end
end
