LibraryManagement::Application.routes.draw do
  get "authors/index"
  devise_for :users

  resources :authors, only: [:index]

  scope "(:locale)", locale: /en|es/ do
  	root to: 'home#index'
  end
end
