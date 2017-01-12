Rails.application.routes.draw do

  get 'owners/show'

  get 'sitters/show'

  devise_for :owners
  devise_for :sitters
  get 'welcome/index'

  root to: 'welcome#index'

  get '/about' => 'welcome#about', as: 'about'

  resources :owners do
    resources :dogs
  end

  put 'rentals/:id(.:format)' => 'rentals#approve', as: 'approve_rental'

  resources :dogs do
    resources:rentals
  end

  resources :rentals

  resources :sitters

  resources :dogs


end
