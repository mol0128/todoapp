# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  deadline   :date
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#  index_tasks_on_user_id   (user_id)
#
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
  has_many :checks, dependent: :destroy

  def check_count
    checks.count
  end
end
