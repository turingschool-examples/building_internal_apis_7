Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books
      resources :stores, only: [:index, :show]
    end

    namespace :v2 do
      resources :books, only: [:index] # develop new version - when DONE, tell FE to change endpoint to v2
    end
  end
end
