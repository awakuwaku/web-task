Rails.application.routes.draw do
  # 認証用アカウント管理ルーティング
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # トップ画面ルーティング
  root to: 'homes#top'

  # About画面ルーティング
  get 'home/about', to: 'homes#about'

  # ユーザ画面ルーティング
  resources :users, only: [:index, :show, :edit, :update]

  # 本画面ルーティング
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]

end
