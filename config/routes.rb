Rails.application.routes.draw do


# ---------------------------------------------------

# user #

# devise
  devise_for :users, controllers: {
    sessions:      'devise/users/sessions',
    passwords:     'devise/users/passwords',
    registrations: 'devise/users/registrations'
  }

# 機能
    resources :users,only: [:show,:index,:edit,:update] do
      resource :relationships,only: [:create,:destroy]
      member do
        get 'follow'
        get 'follower'
      end
      resources :gyms,only: [:show,:index]  do
        resource :comments, only: [:create, :destroy]
      end
      resources :supplements,only: [:show,:index] do
        resource :likes, only: [:create, :destroy]
        resource :comments, only: [:create, :destroy]
      end
      resources :columns,only: [:show,:index]
    end


# ---------------------------------------------------

# admin #

# devise
  devise_for :admins, controllers: {
    sessions:      'devise/admins/sessions',
    passwords:     'devise/admins/passwords',
    registrations: 'devise/admins/registrations'
  }

  namespace :admin do
    resources :users, only: [:show, :index, :edit, :update, :destroy]
    resources :genres, only: [:show, :index, :edit, :update, :destroy]
    resources :supplements, only: [:show, :index, :edit, :update, :destroy] do
      resource :comments, only: [:destroy]
    end
    resources :columns, only: [:show, :index, :edit, :update, :destroy]
    resources :gyms, only: [:show, :index, :edit, :update, :destroy] do
      resource :comments, only: [:destroy]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
