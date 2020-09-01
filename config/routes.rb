Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :incidents, except: [:new, :edit] do
    resources :cases, only: [:index, :create]
  end
end
