class Note < ApplicationRecord
  scope :publicly_available, -> { where(shared: true) }
  validates :title, presence: true, length: { maximum: 140 }

  belongs_to :user
  has_many :attachments, dependent: :destroy
end
