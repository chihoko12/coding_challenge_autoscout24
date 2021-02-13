Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'contacts#index'

  get "listings/price", to: "listings#price_per_seller_type"

end
