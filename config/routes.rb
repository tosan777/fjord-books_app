Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    get "sign_up", to: "users/registrations#new"
    get "login", to: "users/sessions#new"
    delete "logout", to: "users/sessions#destroy"
    get "edit", to: "users/registrations#edit"
  end
  # letter opener web 用のルーティング
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
  resources :books
  root 'my_profile#show'
  get  'users/show'
  get  'users', to: 'users#index'
  # ユーザー詳細ページへのルーティング
  match 'users/:id' => 'users#show', :via => :get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
