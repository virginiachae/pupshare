class AddAddressToDogs < ActiveRecord::Migration[5.0]
  def change
    add_column :dogs, :address, :string
  end
end
