Rails.application.routes.draw do
  root "payment_requests#index"

  resources :payment_requests, only: [:index] do
    patch :accept, on: :member
    patch :reject, on: :member
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
