class AddDescriptionToSitters < ActiveRecord::Migration[5.0]
  def change
    add_column :sitters, :description, :string
  end
end
