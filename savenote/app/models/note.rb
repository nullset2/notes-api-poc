class Note < ApplicationRecord
  scope :public, where(shared: true)
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true

  belongs_to :user
end
