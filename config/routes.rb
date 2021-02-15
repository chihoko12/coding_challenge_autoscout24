Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "listings#index"

  resources :listings do
    collection { post :import }
    collection { get :price_per_seller_type, as: 'price' }
    collection { get :cars_by_make, as: 'cars' }
    end

  resources :contacts do
    collection { post :import }
    collection { get :price_most_contacted, as: 'price_contacted' }
    collection { get :price_top_five_contacted, as: 'price_top_five_contacted' }
  end
end
