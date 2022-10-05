Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    root to: 'users/sessions#new'
    # get "user/:id", :to => "users/registrations#detail"
    # get 'logout', to: 'users/sessions#destroy'
    # root "users/sessions#new"
    # get "signup", :to => "users/registrations#new"
    # get "logout", :to => "users/sessions#destroy"
  end
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
