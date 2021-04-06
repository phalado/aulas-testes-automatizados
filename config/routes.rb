Rails.application.routes.draw do
  resources :pets
  devise_for :users, path: '', 
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
