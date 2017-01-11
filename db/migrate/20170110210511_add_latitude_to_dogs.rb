class AddLatitudeToDogs < ActiveRecord::Migration[5.0]
  def change
    add_column :dogs, :latitude, :float
  end
end
