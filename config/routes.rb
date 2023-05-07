Rails.application.routes.draw do
  #get 'books/new'
  get 'books' =>'books#index'
  post 'books' =>'books#create'
  get 'books/:id/edit' => 'books#edit',as:'edit_book'
  get '' => 'homes#top'
  get 'books/:id' => 'books#show',as:'book'
  patch'books/:id' =>'books#update',as:'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
