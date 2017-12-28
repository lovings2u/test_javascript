class BoardController < ApplicationController
  before_action :user_sign_in?, except: [:index, :show]

  def index
    @boards = Board.all
    puts current_user.inspect
  end

  def show
    @board = Board.find(params[:id])
  end

  def new

  end

  def create
    board = Board.create(user_id: current_user.id, title: params[:title], contents: params[:contents])
    redirect_to "/boards/#{board.id}", notice: "글 작성 완료!!"
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    board = Board.find(params[:id])
    board.update(title: params[:title], contents: params[:contents])
    redirect_to "/boards/#{board.id}", notice: "글 수정 완료!!!"
  end

  def destroy
    Board.find(params[:id]).destroy
    redirect_to '/', notice: "글 삭제 완료!!!"
  end
end
