Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :users
      resources :statuses
      get "/cards", to: "cards#index"
      post "/search", to: "cards#search"
    end 
  end     
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
