Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: "home#index"
   resources :subcategories
   resources :categories 
   resources :products do
    collection do
      post '/select_category', to: 'products#select_category'
      post '/select_subcategory', to: 'products#select_subcategory'
   end
  end
end
