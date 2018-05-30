Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only:[:edit, :update, :show] do
    resources :guarantors, only: [:new, :edit, :create, :update, :show]
  end
  resources :candidatures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
