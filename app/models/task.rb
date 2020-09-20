class Task < ApplicationRecord
  has_one_attached :eyecatch

  validates :title, presence: true
  validates :title, length: { minimum: 3, maximum: 50 }
  validates :title, uniqueness: true

  validates :content, presence: true
  validates :content, length: { minimum: 5, maximum: 300 }
  validates :content, uniqueness: true

  belongs_to :user
  belongs_to :board

  has_many :comments, dependent: :destroy
end
