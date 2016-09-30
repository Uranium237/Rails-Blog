Rails.application.routes.draw do
  
  get 'contacts/index'

  resources :articles do
    resources :comments
  end
  root 'welcome#index'
end
