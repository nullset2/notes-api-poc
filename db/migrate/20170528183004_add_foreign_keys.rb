class AddForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :user_id, :integer
    add_column :file_attachments, :note_id, :integer
  end
end
