Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/candidatures/:token', to: "candidatures#private_show", as: :candidature_agence

  get '/users/:id/download', to: "agencies#download", as: :download

  resources :users, only:[:edit, :update, :show] do
    resources :guarantors, only: [:new, :edit, :create, :update, :show]
    resources :candidatures
  end

  patch '/candidatures/:id/validate', to: 'candidatures#validate', as: :validate
  patch '/candidatures/:id/decline', to: 'candidatures#decline', as: :decline

  resources :agencies, only: [:show, :new, :create, :edit, :update] do
    resources :flats
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
