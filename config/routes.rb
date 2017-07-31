Rails.application.routes.draw do
  resources :users do
    resources :books, only: [:create, :index]
  end
end
