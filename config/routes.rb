Rails.application.routes.draw do

# user #--------------------------------------------

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
    get "homes/tos" => "users/homes#tos"


  namespace :users do
    resources :users,only: [:index, :edit, :show, :update] do
      resource :relationships,only: [:create,:destroy]
      member do
        get 'follow'
        get 'follower'
        get 'withdraw'
        patch 'status_change' => 'users#status_change'
      end
      get "contact" => "homes#contact"
      post "contact" => "homes#create"
    end

    resources :supplements,only: [:index, :show] do
      resource :likes, only: [:create, :destroy]
      resource :comments, only: [:create, :destroy]
    end

    resources :gyms,only: [:index, :show]  do
      resource :comments, only: [:create, :destroy]
    end

    resources :articles,only: [:index, :show]

    resources :daily_cals, only: [:index, :create, :new, :show]
    resources :foods, only: [:index, :show]
    resources :trainings, only: [:index, :show]
    resources :my_menus, only: [:index, :create, :update, :destroy] do
      member do
        post "training" => "my_menus#training"
      end
      collection do
        delete :destroy_all
      end
    end
  end
# ---------------------------------------------------
# admin----------------------------------------------

# devise
  devise_for :admins, controllers: {
    sessions:      'devise/admins/sessions',
    passwords:     'devise/admins/passwords',
    registrations: 'devise/admins/registrations'
  }

# 機能

  namespace :admins do
    resources :users, only: [:index, :edit, :show, :update, :destroy]
    resources :foods, only: [:index, :create, :new, :edit, :show, :update, :destroy]
    resources :trainings, only: [:index, :create, :new, :edit, :show, :update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :food_genres, only: [:index, :create, :edit, :update, :destroy]
    resources :training_genres, only: [:index, :create, :edit, :update, :destroy]
    resources :daily_cals, only: [:index, :show, :update]
    resources :supplements, only: [:index, :create, :new, :edit, :show, :update, :destroy] do
      resource :comments, only: [:destroy]
    end
    resources :articles, only: [:index, :create, :new, :edit, :show, :update, :destroy]
    resources :gyms, only: [:index, :create, :new, :edit, :show, :update, :destroy] do
      resource :comments, only: [:destroy]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
