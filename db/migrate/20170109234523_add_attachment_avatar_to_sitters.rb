class AddAttachmentAvatarToSitters < ActiveRecord::Migration
  def self.up
    change_table :sitters do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :sitters, :avatar
  end
end
