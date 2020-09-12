class TasksController < ApplicationController
  # def index
  #   @tasks = Task.all
  # end

  def show
    
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    if @task.save
      redirect_to board_path(board), notice: 'タスクを追加'
    else
      flash.now[:error] = 'できませんでした'
      render :new
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :content).merge(user_id: current_user.id)
  end
end