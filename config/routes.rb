Rails.application.routes.draw do
  resources :books do
    resources :reservations, only: [:index, :new, :create]
  end

  resources :reservations, except: [:new, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
