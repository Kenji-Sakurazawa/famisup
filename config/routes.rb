Rails.application.routes.draw do

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :roles do
    get "parent", to: "parent#index"
    get "student", to: "student#index"
    get "other", to: "other#index"
  end

  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  get 'topics/index' => 'topics#index'
  post 'topics/create' => 'topics#create'
  delete 'topics/delete/:id' => 'topics#delete', as: :topics_delete

  post 'post/create' => 'post#create', as: :post_create
  get 'post/edit/:id' => 'post#edit', as: :post_edit
  get 'post/show/:id' => 'post#show', as: :post_show
  patch 'post/update/:id' => 'post#update'
  put 'post/update/:id' => 'post#update'
  delete 'post/delete/:id' => 'post#destroy', as: :post_destroy
  get 'user' => 'topics#index', as: :user
end
