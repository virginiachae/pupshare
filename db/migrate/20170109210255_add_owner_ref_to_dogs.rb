class AddOwnerRefToDogs < ActiveRecord::Migration[5.0]
  def change
    add_reference :dogs, :owner, index: true, foreign_key: true
  end
end
