Rails.application.routes.draw do
  get 'home/index'

  # Ruta para la acción index de PublicationsController
  get 'publications', to: 'publications#index', as: :publications

  # Ruta independiente para publication_comments_path
  get 'publications/:publication_id/comments', to: 'comments#index', as: :publication_comments

  resources :publications do
    resources :comments, only: [:new, :create, :show, :edit, :update, :destroy]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root "home#index"
end
