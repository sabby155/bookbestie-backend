Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :users
      resources :statuses
      get "/cards", to: "cards#index"

      post "/search", to: "cards#search"
      get "/bestsellers", to: "cards#bestsellers"

      post "/status", to: "statuses#create"
      get "/status", to: "statuses#index"
      patch "/status/:id", to: "statuses#update"

      

    end 
  end     
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
