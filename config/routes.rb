Rails.application.routes.draw do

  devise_for :users
  # get 'persons/profile'

  get 'persons/profile', as: 'user_root'

  get 'contacts/index'

  resources :articles do
    resources :comments
  end
  root 'welcome#index'

end
