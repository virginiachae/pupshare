Rails.application.routes.draw do


  get 'owners/show'

  get 'sitters/show'

  devise_for :owners
  devise_for :sitters
  get 'welcome/index'

  root to: 'welcome#index'

  get '/owners/:owner_id/dogs' => 'dogs#index', as: 'dogs'
  resources :owners do
    resources :dogs
  end
  resources :sitters

  resources :dogs


end
