class Comment < ApplicationRecord
  validates :content, presence: true
  validates :content, length: { minimum: 5, maximum: 200 }

  belongs_to :task
  belongs_to :user
end
