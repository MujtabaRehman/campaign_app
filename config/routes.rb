Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'campaigns#index'
  get 'home/index'
  get 'home/about'

  concern :commentable do
    resources :comments
  end
  resources :campaigns , concern: :commentable do
    resources :do_lists
    resources :discussion_topics ,concerns: :commentable
  end

  resources :experts,:novices
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end