class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def show
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:id])
    @comments = @task.comments
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    if @task.save
      redirect_to board_path(board), notice: 'タスクを作成しました'
    else
      flash.now[:alert] = '作成できませんでした'
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to board_task_path(@task.board), notice: '更新しました'
    else
      render :edit
      flash.now[:alert] = '更新できませんでした'
    end
  end

  def destroy
    board = Board.find(params[:board_id])
    task = current_user.tasks.find(params[:id])
    task.destroy!
    redirect_to board_path(board), notice: 'タスクを削除しました'
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :eyecatch, :deadline).merge(user_id: current_user.id)
  end
end
