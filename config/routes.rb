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

    root 'users/homes#top'
    get "homes/about" => "users/homes#about"
    get "homes/privacy" => "users/homes#privacy"
    get "homes/contact" => "users/homes#contact"
    post "homes/contact" => "users/homes#create"
    get "homes/tos" => "users/homes#tos"


  namespace :users do
    resources :users,only: [:show,:index,:edit,:update] do
      resource :relationships,only: [:create,:destroy]
      member do
        get 'follow'
        get 'follower'
        get 'withdraw'
        patch 'status_change' => 'users#status_change'
      end
    end

    resources :supplements,only: [:show,:index] do
      resource :likes, only: [:create, :destroy]
      resource :comments, only: [:create, :destroy]
    end

    resources :gyms,only: [:show,:index]  do
      resource :comments, only: [:create, :destroy]
    end
    resources :articles,only: [:show,:index]
  end
# ---------------------------------------------------

# admin #

# devise
  devise_for :admins, controllers: {
    sessions:      'devise/admins/sessions',
    passwords:     'devise/admins/passwords',
    registrations: 'devise/admins/registrations'
  }

# 機能

  namespace :admins do
    resources :users, only: [:show, :index, :edit, :update, :destroy]
    resources :genres, only: [:create, :index, :edit, :update, :destroy]
    resources :supplements, only: [:new,:show, :index, :edit, :update, :destroy, :create] do
      resource :comments, only: [:destroy]
    end
    resources :articles, only: [:new, :create, :show, :index, :edit, :update, :destroy]
    resources :gyms, only: [:index,:new,:create,:show,  :edit, :update, :destroy] do
      resource :comments, only: [:destroy]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
