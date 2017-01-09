class AddLastToOwners < ActiveRecord::Migration[5.0]
  def change
    add_column :owners, :last, :string
  end
end
