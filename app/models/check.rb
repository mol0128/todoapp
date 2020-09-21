# == Schema Information
#
# Table name: checks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  task_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_checks_on_task_id  (task_id)
#  index_checks_on_user_id  (user_id)
#
class Check < ApplicationRecord
  belongs_to :user
  belongs_to :task
end
