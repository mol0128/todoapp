class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to board_path(@board), notice: '更新'
    else
      flash.now[:error] = 'failed'
      render :new
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  private
  def board_params
    params.require(:board).permit(:title, :content)
  end
end
