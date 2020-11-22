class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # ユーザサインアップ時の情報追加
  # ユーザ名による認証は以下設定参照
  #  File:config/initializers/devise.rb
  #   config.authentication_keys = [:username]
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

  # ユーザ操作の制限
  def correct_user?(user)
    if current_user.nil?
      return false
    else
      user.id.equal?(current_user.id)
    end
  end

  # サインイン・ログイン後の画面遷移処理
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  # サインアウト後の画面遷移処理
  def after_sign_out_path_for(resource)
    root_path
  end
end
