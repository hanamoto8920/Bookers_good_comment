Rails.application.routes.draw do
  # get 'users/show'
  # get 'books/index'
  # get 'books/create'
  # get 'books/edit'
  # get 'books/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ブックモデルのルーティング
  # ブックコントローラ
  resources :books, only: [:edit, :create, :index, :show, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  # # ホームのコントローラ
  root "homes#top"
  get "home/about" => "homes#index"


  # ユーザーモデルのルーティング
  # ユーザーコントローラ
  resources :users, only: [:show, :edit, :update, :index] do
    # フォローリスト
    get "followlist" => "relationships#followlist" 
    # フォロワーリスト
    get "followerlist" => "relationships#followerlist" 
  
  end


  # ログイン認証が成功した後、投稿画像の一覧画面が表示される
  # root 'books#index'

  # フォローのルーティング
  post 'create/:id' => 'relationships#create', as: 'create' # フォローする
  post 'destroy/:id' => 'relationships#destroy', as: 'destroy' # フォロー外す
  

end

