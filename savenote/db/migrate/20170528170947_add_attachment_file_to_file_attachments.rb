class AddAttachmentFileToFileAttachments < ActiveRecord::Migration
  def self.up
    change_table :file_attachments do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :file_attachments, :file
  end
end
