class Board < ApplicationRecord
  has_one_attached :eyecatch

  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :tasks, dependent: :destroy
end
