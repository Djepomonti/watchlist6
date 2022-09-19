Rails.application.routes.draw do
  devise_for :users
  root to: "lists#index"
  resources :lists, except: [:edit] do
    resources :bookmarks, only: %i[new create]
  end

  resources :bookmarks, only: [:delete]
end
