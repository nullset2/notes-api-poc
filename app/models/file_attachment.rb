class Attachment < ApplicationRecord
  belongs_to :note
  has_attached_file :file
  validates :file, attachment_presence: true, attachment_size: { less_than: 11.megabytes }
  do_not_validate_attachment_file_type :file
end
