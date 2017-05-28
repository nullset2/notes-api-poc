class FileAttachment < ApplicationRecord
  belongs_to :note
  has_attached_file :file
end
