class Task < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 10 }
  
end
