DeclarativeAuthorizationRails3ExampleApp::Application.routes.draw do
  resources :articles, :comments
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "articles#index"
  devise_for :users
  resources :users
end