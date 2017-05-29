class ChangeFileAttachmentsToAttachments < ActiveRecord::Migration[5.0]
  def change
    rename_table :file_attachments, :attachments
  end
end
