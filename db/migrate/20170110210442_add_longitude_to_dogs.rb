class AddLongitudeToDogs < ActiveRecord::Migration[5.0]
  def change
    add_column :dogs, :longitude, :float
  end
end
