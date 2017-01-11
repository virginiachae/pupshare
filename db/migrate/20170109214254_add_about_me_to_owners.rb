class AddAboutMeToOwners < ActiveRecord::Migration[5.0]
  def change
    add_column :owners, :about_me, :string
  end
end
