class Note < ApplicationRecord
  scope :public, where(shared: true)
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true

  belongs_to :user
  has_many :file_attachments, dependent: :destroy
  accepts_nested_attributes_for :file_attachments
end
