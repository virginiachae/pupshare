class AddDogRefToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :dog, foreign_key: true
  end
end
