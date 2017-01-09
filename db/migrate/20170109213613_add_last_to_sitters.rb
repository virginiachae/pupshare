class AddLastToSitters < ActiveRecord::Migration[5.0]
  def change
    add_column :sitters, :last, :string
  end
end
