Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only:[:index, :show,]
  resources :books
  # letter opener web 用のルーティング
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
