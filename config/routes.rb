Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, 
             controllers: {                                 
                                                                                   
               omniauth_callbacks: 'users/omniauth_callbacks'                                      
             }
             
  # devise_for :users, path: '', path_names: { sign_up: 'register', sign_in: 'login', sign_out: 'logout' }
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/auth/:provider/callback', to: 'users/omniauth_callbacks#azure_activedirectory_v2'
  # get '/auth/azure_activedirectory_v2', to: 'users/omniauth_callbacks#azure_activedirectory_v2', as: :user_azure_activedirectory_v2_omniauth_authorize
  # get '/auth/azure_activedirectory_v2/callback', to: 'users/omniauth_callbacks#azure_activedirectory_v2'
end
