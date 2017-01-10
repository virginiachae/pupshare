class AddAttachmentAvatarToOwners < ActiveRecord::Migration
  def self.up
    change_table :owners do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :owners, :avatar
  end
end
