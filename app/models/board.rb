class Board < ApplicationRecord
  has_one_attached :eyecatch

  validates :title, presence: true
  validates :title, length: { minimum: 3, maximum: 50 }
  validates :title, uniqueness: true

  validates :content, presence: true
  validates :content, length: { minimum: 5, maximum: 200 }
  validates :content, uniqueness: true

  belongs_to :user
  has_many :tasks, dependent: :destroy
end
