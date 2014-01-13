LibraryManagement::Application.routes.draw do
  devise_for :users

  resources :authors, only: [:index] do
  	resources :list_of_books, controller: 'author_books_for_clients', only: [:index]
  end

  resources :books, only: :show do
  	resources :orders, only: [:create, :update, :destroy]
  end
   # resources :books

  resources :my_orders, controller: 'client_orders', only: [:index]
  resources :section_orders, controller: 'librarian_orders', only: [:index]

  scope "(:locale)", locale: /en|es/ do
  	root to: 'home#index'
  end
end
