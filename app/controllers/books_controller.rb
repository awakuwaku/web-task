class BooksController < ApplicationController
  before_action :authenticate_user!,only: [:create,:edit,:update,:destroy,:index,:show]

  # 本の情報を保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to @book, notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  # 本のリストを表示
  def index
    @books = Book.all
    @book = Book.new
  end

  # 本の情報の詳細を表示
  def show
    @book = Book.find(params[:id])
  end

  # 本の情報の変更画面を表示
  def edit
    @book = Book.find(params[:id])
    screen_user(@book)
  end

  # 本の情報の変更
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: "You have updated book successfully."
    else
      render 'edit'
    end
  end

  # 本の情報を削除
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url
  end

  private

  # 本の情報のストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

  # 自己ユーザチェック
  def screen_user(book)
    if book.user.id != current_user.id
      redirect_to books_path
    end
  end

end
