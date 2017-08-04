Rails.application.routes.draw do
  resources :users do
    resources :books, only: [:create, :index, :show], shallow: true
  end
end
