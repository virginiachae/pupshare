class AddDogRefToOwners < ActiveRecord::Migration[5.0]
  def change
    add_reference :owners, :dog, index: true, foreign_key: true
  end
end
