class ChecksController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    board = Board.find(params[:board_id])
    task = board.tasks.find(params[:task_id])
    task.checks.create!(user_id: current_user.id)
    redirect_to board_task_path(board_id: board.id, id: task.id)
  end
end