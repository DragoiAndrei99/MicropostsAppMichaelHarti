class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 280 }
end