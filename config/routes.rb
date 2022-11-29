Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  # ネストさせることによりアソシエーション先の:idを取得できる
  resources :users, only: %i(index show) do
    member do
      get :follows, :followers
    end
    resource :follow_relationships, only: [:create, :destroy]
  end
end
