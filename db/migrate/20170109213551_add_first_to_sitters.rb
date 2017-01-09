class AddFirstToSitters < ActiveRecord::Migration[5.0]
  def change
    add_column :sitters, :first, :string
  end
end
