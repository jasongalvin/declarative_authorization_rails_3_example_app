DeclarativeAuthorizationRails3ExampleApp::Application.routes.draw do
  resources :articles, :comments
  authenticated :user do
    root :to => 'users#index'
  end
  root :to => "articles#index"
  devise_for :users
  resources :users
  namespace :admin do
    resources :users
    root :to => 'users#index'
  end
end