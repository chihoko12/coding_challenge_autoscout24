Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "listings#index"

  resources :listings do
    collection { post :import }
    collection { get :price_per_seller_type, as: 'price' }
    collection { get :cars_by_make, as: 'cars' }
    collection { get :price_most_contacted, as: 'price_contacted' }
    collection { get :price_top_five_contacted, as: 'price_top_five_contacted' }
    end

  resources :contacts do
    collection { post :import }
  end

  # get "listings/price", to: "listings#price_per_seller_type"
  # get "listings/cars", to: "listings#cars_by_make"
  # get "listings/price_contacted", to: "listings#price_most_contacted"
  # get "listings/price_top_five_contacted", to: "listings#price_top_five_contacted"

end
