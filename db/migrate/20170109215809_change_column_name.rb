class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :owners, :about_me, :description
  end
end
