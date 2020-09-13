class TasksController < ApplicationController

  def show
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:id])
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

  def edit
    board = Board.find(params[:board_id])
    @task = board.tasks.find(params[:id])
  end

  def update
    board = Board.find(params[:board_id])
    @task = board.tasks.find(params[:id])
      if @task.user_id == current_user.id
          if @task.update(task_params)
            redirect_to board_task_path(@task.board), notice: '更新しました'
          else
            render :edit
          end
      else
        redirect_to board_task_path
      end
  end

  def destroy
    board = Board.find(params[:board_id])
    task = board.tasks.find(params[:id])
    if task.user_id == current_user.id
      task.destroy!
      redirect_to root_path
    else
      redirect_to board_task_path
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :eyecatch, :deadline).merge(user_id: current_user.id)
  end
end