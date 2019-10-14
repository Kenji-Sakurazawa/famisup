Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :roles do
    get "parent", to: "parent#index"
    get "student", to: "student#index"
    get "other", to: "other#index"
  end

end
