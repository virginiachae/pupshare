class AddDatesAvailableToDogs < ActiveRecord::Migration[5.0]
  def change
    add_column :dogs, :date_start, :string
    add_column :dogs, :date_end, :string
  end
end
