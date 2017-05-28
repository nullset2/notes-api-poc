class FileAttachment < ApplicationRecord
  belongs_to :note
  has_attached_file :file
  validates :file, attachment_presence: true, attachment_size: { less_than: 10.megabytes }
end
