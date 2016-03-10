Rails.application.routes.draw do
  get 'user_sessions/new'

  get 'user_sessions/create'

  get 'user_sessions/destroy'

  resources :users
# pour la resource slides sur le frontend,
# on autorise que la vue index
# les autres vues ne seront pas utilisées
  resources :slides, only: [:index]
  
  root :to => 'users#index'
  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  # on crée un namespace admin pour administrer les slides
  namespace :admin do
    resources :slides

    # On ajoute un root dans le namespace pour que
    # http://localhost:3000/admin
    # charge par défaut
    # http://localhost:3000/admin/sliders
    # l'url dans la barre d'adresse restera
    # http://localhost:3000/admin
    root 'slides#index'
  end

  # On crée là aussi un root pour que
  # http://localhost:3000
  # charge http://localhost:3000/sliders
  # l'url dans la barre d'adresse restera
  # http://localhost:3000/

  root 'slides#index'
end
