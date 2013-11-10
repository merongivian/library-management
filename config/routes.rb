LibraryManagement::Application.routes.draw do
  scope "(:locale)", locale: /en|es/ do
  	root to: 'home#index'
  end
end
