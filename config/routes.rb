LibraryManagement::Application.routes.draw do
  devise_for :users
  scope "(:locale)", locale: /en|es/ do
  	root to: 'home#index'
  end
end
