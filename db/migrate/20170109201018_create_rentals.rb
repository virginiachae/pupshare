class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.belongs_to :dog, foreign_key: true
      t.belongs_to :sitter, foreign_key: true
      t.boolean :pending
      t.boolean :approved
      t.string :comments

      t.timestamps
    end
  end
end
