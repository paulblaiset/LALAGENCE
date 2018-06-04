Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/candidatures/:token', to: "candidatures#private_show", as: :candidature_agence

  resources :users, only:[:edit, :update, :show] do
    resources :guarantors, only: [:new, :edit, :create, :update, :show]
    resources :candidatures
  end


  resources :agencies, only: [:show, :new, :create, :edit, :update] do
    resources :flats
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
