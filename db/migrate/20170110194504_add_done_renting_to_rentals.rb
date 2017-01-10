class AddDoneRentingToRentals < ActiveRecord::Migration[5.0]
  def change
    add_column :rentals, :done_renting, :boolean
  end
end
