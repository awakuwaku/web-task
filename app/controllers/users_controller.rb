class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :screen_user, only: [:edit,:update,:destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ユーザのリストを表示
  def index
    @users = User.all
    @book = Book.new
  end

  # ユーザの情報を表示
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  # ユーザの変更画面を表示
  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  # ユーザの情報を変更
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render 'edit'
    end
  end

  private
  # ユーザの情報のストロングパラメータ
  def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
  end

  # 自己ユーザチェック
  def screen_user
    unless params[:id].to_i == current_user.id
      redirect_to user_path(current_user)
    end
  end

end
