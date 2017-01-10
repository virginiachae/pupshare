Rails.application.routes.draw do

  get 'owners/show'

  get 'sitters/show'

  devise_for :owners
  devise_for :sitters
  get 'welcome/index'

  root to: 'welcome#index'


  resources :owners do
    resources :dogs
  end

  resources :dogs do
    resources:rentals
  end


  resources :sitters

  resources :dogs


end
