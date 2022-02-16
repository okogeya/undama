Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :events do
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
