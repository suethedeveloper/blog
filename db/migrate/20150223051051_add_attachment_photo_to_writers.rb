class AddAttachmentPhotoToWriters < ActiveRecord::Migration
  def self.up
    change_table :writers do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :writers, :photo
  end
end
