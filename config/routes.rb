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
  get 'topics/show/:id' => 'topics#show', as: :topics_show
  post 'topics/create' => 'topics#create'
  delete 'topics/delete/:id' => 'topics#delete', as: :topics_delete
end
