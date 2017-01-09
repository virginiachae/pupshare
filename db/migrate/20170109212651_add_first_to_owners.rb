class AddFirstToOwners < ActiveRecord::Migration[5.0]
  def change
    add_column :owners, :first, :string
  end
end
